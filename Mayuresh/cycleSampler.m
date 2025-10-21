function currentCycle = cycleSampler(Qnom, samplingFrequency, RestTime1, chargeRate, RestTime2)
    dischargeRate = 1;
    time_intervals = [100, 3600 * 0.10 / dischargeRate, RestTime1, 3600 * 0.70 / chargeRate, RestTime2, 3600 * 0.60 / dischargeRate, 30*60];
    currentDraw = Qnom * [0, dischargeRate, 0, -chargeRate, 0, dischargeRate, 0];

    % Total simulation time
    total_time = sum(time_intervals);

    % Create time vector
    t = 0:samplingFrequency:(total_time - samplingFrequency);  % Row vector

    % Initialize current vector
    current_profile = zeros(size(t));

    % Fill current profile based on time intervals
    t_cursor = 0;
    for i = 1:length(time_intervals)
        t_start = t_cursor;
        t_end = t_cursor + time_intervals(i);
        
        mask = (t >= t_start) & (t < t_end);
        current_profile(mask) = currentDraw(i);
        
        % Move cursor forward
        t_cursor = t_end;
    end

    % Combine into two-column array
    currentCycle = [t', current_profile'];

end