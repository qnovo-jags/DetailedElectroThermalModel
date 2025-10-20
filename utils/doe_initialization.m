% %% ------------------------------------------------------------------------
function doe_initialization(modelName, myDOE, target_sequence, ...
                            CellNominalCapacityAh, numParallelCells, ...
                            SYPACK, PACK_ID)
% DOE initialization (mode-agnostic)
%
% Inputs:
%   modelName            - Simulink model name
%   myDOE                - Full DOE struct array
%   target_sequence      - Run sequence number
%   CellNominalCapacityAh- Cell nominal capacity
%   numParallelCells     - Number of parallel cells per module
%   SYPACK               - Pack structure
%   PACK_ID              - AN id for a pack such as 1,2,3,... 

    % Filter DOE for the run sequence
    filtered_DOE = myDOE([myDOE.run_sequence] == target_sequence);
    selectedDOE = filtered_DOE(1);

    % Get ambient temperature
    target_ambient_temp = selectedDOE.ambient_temperature_K;

    % Open and compile model
    open_system(modelName);
    compilePackModel(SYPACK, target_ambient_temp, PACK_ID);

    % Setup initial current input
    currentData = setupCurrentInput(CellNominalCapacityAh, ...
                                    numParallelCells, ...
                                    selectedDOE.sampling_rate_s, ...
                                    selectedDOE.initial_rest_s, ...
                                    selectedDOE.rest_before_charge_s, ...
                                    selectedDOE.charge_crate, ...
                                    selectedDOE.rest_after_charge_s, ...
                                    selectedDOE.discharge_crate, ...
                                    selectedDOE.rest_after_discharge_s, ...
                                    selectedDOE.number_of_cycles, ...
                                    selectedDOE.depth_of_charge, ...
                                    selectedDOE.depth_of_discharge);

    assignin('base', 'currentData', currentData);

    % Fast restart Off
    set_param(modelName, 'FastRestart', 'off');

    % Solver options
    % set_param(modelName, 'Solver', 'ode15s', 'RelTol', 1e-4, ...
    %     'AbsTol', 1e-6, 'MaxStep', 20);

    % Simulation input
    in = Simulink.SimulationInput(modelName);
    in = in.setVariable('AmbientTemperature', target_ambient_temp);
    stop_time = currentData(end,1);
    in = in.setModelParameter('StartTime','0','StopTime',num2str(stop_time));

    % Set simulation mode
    % set_param(modelName, 'SimulationMode', simMode);

    % Run initialization simulation
    sim(in);
    fprintf("Model initialized using DOE: %s (Run Sequence %d)\n", ...
            selectedDOE.doe_id, target_sequence);
end