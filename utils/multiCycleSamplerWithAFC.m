
function currentCycle = multiCycleSamplerWithAFC( ...
    Qnom, numParallelCells, samplingFrequency, ...
    RestTime0, RestTime1, chargeRates, RestTime2, ...
    dischargeRate, RestTime3, numChargeCycles, ...
    depthOfCharge, depthOfdischarge, chargeMode)

    % ---------------------------
    % 1. Initial rest + discharge
    % ---------------------------
    time_intervals = [RestTime0, 3600*0.10/dischargeRate, RestTime1];
    currentDraw     = numParallelCells * Qnom * [0, dischargeRate, 0];

    switch upper(chargeMode)

        case 'STEP'
            % Single-step charge
            t_charge = 3600 * depthOfCharge / chargeRates(1); 
            time_intervals = [time_intervals, t_charge];
            currentDraw    = [currentDraw, -numParallelCells * Qnom * chargeRates(1)];

        case 'AFC'
            % Define internal multi-step durations (seconds)
            chargeRates   = [2.23, 1.69, 1.425];   % C-rate for each step
            stepDurations = [607, 298, 435];       % relative durations (s)
            
            % Normalize durations to total depthOfCharge
            totalStepDur = sum(stepDurations);
            
            % Compute actual duration of each step so total DoC = depthOfCharge
            % Each step: t_step = (stepDur / totalStepDur) * (depthOfCharge / chargeRate) * 3600
            t_steps = (stepDurations / totalStepDur) .* (depthOfCharge ./ chargeRates) * 3600;
            
            % Step currents
            I_steps = -numParallelCells * Qnom * chargeRates;  % current in A
            
            % Append to main profile
            time_intervals = [time_intervals, t_steps];
            currentDraw    = [currentDraw, I_steps];

        otherwise
            error('Unknown chargeMode: choose ''STEP'' or ''AFC''');
    end

    % -------------------------------
    % Add final rest, discharge, rest
    % -------------------------------
    time_intervals = [time_intervals, RestTime2, 3600*depthOfdischarge/dischargeRate, RestTime3];
    currentDraw    = [currentDraw, 0, numParallelCells*Qnom*dischargeRate, 0];

    % ---------------------------------------------
    % Build time vector for a single cycle
    % ---------------------------------------------
    total_time = sum(time_intervals);
    t_single = 0:samplingFrequency:(total_time - samplingFrequency);

    % Build current vector
    current_single = zeros(size(t_single));
    t_edges = [0, cumsum(time_intervals)];  % edges of each interval

    for i = 1:length(currentDraw)
        mask = (t_single >= t_edges(i)) & (t_single < t_edges(i+1));
        current_single(mask) = currentDraw(i);
    end

    % ---------------------------------------------
    % Repeat for numChargeCycles
    % ---------------------------------------------
    currentCycle = [];
    for k = 1:numChargeCycles
        t_offset = (k-1)*total_time;
        t_cycle = t_single + t_offset;
        currentCycle = [currentCycle; [t_cycle', current_single']];
    end
end



% function currentCycle = multiCycleSamplerWithAFC(Qnom, numParallelCells, samplingFrequency, ...
%     RestTime0, RestTime1, chargeRates, RestTime2, dischargeRate, RestTime3, ...
%     numChargeCycles, depthOfCharge, depthOfdischarge, chargeMode, varargin)
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
% 
% 
%     % Initialize time intervals and current draw (rest + initial discharge)
%     time_intervals = [RestTime0, 3600*0.10/dischargeRate, RestTime1];
%     currentDraw = numParallelCells * Qnom * [0, dischargeRate, 0];
% 
%     % chargeMode = 'STEP';
% 
%     switch upper(chargeMode)
%         case 'AFC'
%             % Use a predefined 6-step AFC profile and ignore input chargeRates
%             fprintf('Using predefined 6-step AFC profile: [%s] C\n', num2str(chargeRates));
%             currentDraw = varargin{1}{1};
% 
%         case 'STEP'
%             % Single-step charge using the first element of input chargeRates
%             time_intervals = [time_intervals, 3600 * depthOfCharge / chargeRates(1)];
%             currentDraw = [currentDraw, -numParallelCells * Qnom * chargeRates(1)];
% 
%         otherwise
%             error('Unknown chargeMode: choose ''AFC'' or ''Step''');
%     end
% 
% 
%     % Add final rest, discharge, and rest
%     time_intervals = [time_intervals, RestTime2, 3600*depthOfdischarge/dischargeRate, RestTime3];
%     currentDraw = [currentDraw, 0, numParallelCells*Qnom*dischargeRate, 0];
% 
%     % Total simulation time per cycle
%     total_time = sum(time_intervals);
% 
%     % Base time vector for a single cycle
%     t_single = 0:samplingFrequency:(total_time - samplingFrequency);
% 
%     % Current profile for a single cycle
%     current_single = zeros(size(t_single));
%     t_cursor = 0;
%     for i = 1:length(time_intervals)
%         t_start = t_cursor;
%         t_end = t_cursor + time_intervals(i);
%         mask = (t_single >= t_start) & (t_single < t_end);
%         current_single(mask) = currentDraw(i);
%         t_cursor = t_end;
%     end
% 
%     % Repeat for numChargeCycles
%     currentCycle = [];
%     for k = 1:numChargeCycles
%         t_offset = (k-1)*total_time;
%         t_cycle = t_single + t_offset;
%         currentCycle = [currentCycle; [t_cycle', current_single']];
%     end
% end
