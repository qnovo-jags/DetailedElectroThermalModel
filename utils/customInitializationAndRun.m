% %% ------------------------------------------------------------------------
function simout = customInitializationAndRun(modelName, myDOE, target_sequence, SYPACK, output_dir, PACK_ID)
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
    currentData = [0,0];

    open_system(modelName);
    compilePackModel(SYPACK, ambient_temperature_K, PACK_ID);

    % Assign currentData to base workspace
    assignin("base", "currentData", currentData);

    % Turn off Fast Restart for clean initialization
    set_param(modelName, 'FastRestart', 'off');
    
    % % Set tolerances and max step size
    set_param(modelName, 'Solver', 'daessc', 'RelTol', '1e-3', 'MaxStep', '0.1');

    % Setup Simulink simulation input
    in = Simulink.SimulationInput(modelName);
    in = in.setVariable('AmbientTemperature', ambient_temperature_K);
    % stop_time = currentData(end,1);
    stop_time = 1;
    
    in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));

    % Run initialization simulation
    simout = sim(in);

    % % Save the results
    % target_id = sprintf('doe%d',1);
    % is_qnovo_format = 1;
    % sampling_rate_s = 1;
    % extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, sampling_rate_s);

end
