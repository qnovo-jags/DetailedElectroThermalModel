% %% ------------------------------------------------------------------------
function simout = customInitializationAndRun(modelName, myDOE, target_sequence, SYPACK, output_dir)
% run_doe_initialization
% One-time model initialization using the first DOE in a given run_sequence
%
% Inputs:
%   modelName            - Name of Simulink model
%   CellNominalCapacityAh- Cell nominal capacity
%   numParallelCells     - Number of parallel cells per module

    % % --- Compile pack model with this ambient temperature ---

    filtered_DOE = myDOE([myDOE.run_sequence] == target_sequence);
    selectedDOE = filtered_DOE(1);
    ambient_temperature_K = selectedDOE.ambient_temperature_K;

    % Extract current input
    currentData = setupCurrentInput(60, ...
                                2, ...
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

    open_system(modelName);
    compilePackModel(SYPACK, ambient_temperature_K);

    % Assign currentData to base workspace
    assignin("base", "currentData", currentData);

    % Turn off Fast Restart for clean initialization
    set_param(modelName, 'FastRestart', 'off');
    
    % % Set tolerances and max step size
    % set_param(modelName, 'FastRestart', 'off');
    % set_param(modelName, 'Solver', 'ode15s', 'RelTol', '1e-5', ...
    %     'AbsTol', '1e-6', 'MaxStep', '10');

    % Setup Simulink simulation input
    in = Simulink.SimulationInput(modelName);
    in = in.setVariable('AmbientTemperature', ambient_temperature_K);
    % stop_time = currentData(end,1);
    stop_time = 4000;
    
    in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));

    % Run initialization simulation
    simout = sim(in);

    % % Save the results
    % target_id = sprintf('doe%d',1);
    % is_qnovo_format = 1;
    % sampling_rate_s = 1;
    % extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, sampling_rate_s);

end
