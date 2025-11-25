% %% ------------------------------------------------------------------------
function doeInitialization(modelName, myDOE, target_sequence, ...
                                CellNominalCapacityAh, numParallelCells, SYPACK)
% run_doe_initialization
% One-time model initialization using the first DOE in a given run_sequence
%
% Inputs:
%   modelName            - Name of Simulink model
%   myDOE                - Full DOE struct array
%   target_sequence      - Run sequence number
%   CellNominalCapacityAh- Cell nominal capacity
%   numParallelCells     - Number of parallel cells per module

    % Filter DOE for the run sequence
    filtered_DOE = myDOE([myDOE.run_sequence] == target_sequence);
    selectedDOE = filtered_DOE(1);

    % % --- Get ambient temperature from the first DOE in this sequence ---
    target_ambient_temp = selectedDOE.ambient_temperature_K;

    % % --- Compile pack model with this ambient temperature ---
    open_system(modelName);
    compilePackModel(SYPACK, target_ambient_temp);

    % Extract current input
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
                                    selectedDOE.depth_of_discharge, ...
                                    selectedDOE.profileType);
    ambient_temperature_K = selectedDOE.ambient_temperature_K;

    % Assign currentData to base workspace
    assignin("base", "currentData", currentData);

    % Turn off Fast Restart for clean initialization
    set_param(modelName, 'FastRestart', 'off');
    
    % % Set tolerances and max step size
    set_param(modelName, 'Solver', 'daessc', 'RelTol', '1e-3', 'MaxStep', '0.1');

    % Setup Simulink simulation input
    in = Simulink.SimulationInput(modelName);
    in = in.setVariable('AmbientTemperature', ambient_temperature_K);
    stop_time = 100;
    in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));

    % Run initialization simulation
    sim(in);
    fprintf("Model initialized using DOE: %s (Run Sequence %d)\n", selectedDOE.doe_id, target_sequence);
end
