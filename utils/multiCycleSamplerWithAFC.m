function currentCycle = multiCycleSamplerWithAFC(Qnom, numParallelCells, samplingFrequency, ...
    RestTime0, RestTime1, chargeRates, RestTime2, dischargeRate, RestTime3, ...
    numChargeCycles, depthOfCharge, depthOfdischarge, chargeMode)
% multicCycleSampler
% Generates a multi-cycle current profile with selectable charge mode
%
% Inputs:
%   Qnom             - Nominal capacity of a single cell (Ah)
%   numParallelCells - Number of cells in parallel per module
%   samplingFrequency- Time step in seconds
%   RestTime0        - Initial rest (s)
%   RestTime1        - Rest after initial discharge (s)
%   chargeRates      - Array of charge rates (C)
%   RestTime2        - Rest after charging (s)
%   dischargeRate    - Discharge rate (C)
%   RestTime3        - Rest after discharge (s)
%   numChargeCycles  - Number of cycles to repeat
%   depthOfCharge    - Depth of charge (fraction)
%   depthOfdischarge - Depth of discharge (fraction)
%   chargeMode       - 'AFC' for multi-step charge, 'Step' for single-step charge
%
% Output:
%   currentCycle     - [time, current] array for all cycles

    % Initialize time intervals and current draw (rest + initial discharge)
    time_intervals = [RestTime0, 3600*0.10/dischargeRate, RestTime1];
    currentDraw = numParallelCells * Qnom * [0, dischargeRate, 0];

    switch upper(chargeMode)
        case 'AFC'
            % Use a predefined 6-step AFC profile and ignore input chargeRates
            chargeRates = [2 1.75 1.5 1.25 1 0.5];  % 6-step AFC
            fprintf('Using predefined 6-step AFC profile: [%s] C\n', num2str(chargeRates));
    
            nSteps = length(chargeRates);
            stepDepth = depthOfCharge / nSteps;
    
            for i = 1:nSteps
                time_intervals = [time_intervals, 3600 * stepDepth / chargeRates(i)];
                currentDraw = [currentDraw, -numParallelCells * Qnom * chargeRates(i)];
            end
    
        case 'STEP'
            % Single-step charge using the first element of input chargeRates
            time_intervals = [time_intervals, 3600 * depthOfCharge / chargeRates(1)];
            currentDraw = [currentDraw, -numParallelCells * Qnom * chargeRates(1)];
    
        otherwise
            error('Unknown chargeMode: choose ''AFC'' or ''Step''');
    end


    % Add final rest, discharge, and rest
    time_intervals = [time_intervals, RestTime2, 3600*depthOfdischarge/dischargeRate, RestTime3];
    currentDraw = [currentDraw, 0, numParallelCells*Qnom*dischargeRate, 0];

    % Total simulation time per cycle
    total_time = sum(time_intervals);

    % Base time vector for a single cycle
    t_single = 0:samplingFrequency:(total_time - samplingFrequency);

    % Current profile for a single cycle
    current_single = zeros(size(t_single));
    t_cursor = 0;
    for i = 1:length(time_intervals)
        t_start = t_cursor;
        t_end = t_cursor + time_intervals(i);
        mask = (t_single >= t_start) & (t_single < t_end);
        current_single(mask) = currentDraw(i);
        t_cursor = t_end;
    end

    % Repeat for numChargeCycles
    currentCycle = [];
    for k = 1:numChargeCycles
        t_offset = (k-1)*total_time;
        t_cycle = t_single + t_offset;
        currentCycle = [currentCycle; [t_cycle', current_single']];
    end
end
