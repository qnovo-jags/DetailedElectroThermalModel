% %% ------------------------------------------------------------------------
function simout = customInitializationAndRun(modelName, currentData, ambient_temperatures, SYPACK, output_dir)
% run_doe_initialization
% One-time model initialization using the first DOE in a given run_sequence
%
% Inputs:
%   modelName            - Name of Simulink model
%   CellNominalCapacityAh- Cell nominal capacity
%   numParallelCells     - Number of parallel cells per module

    % % --- Compile pack model with this ambient temperature ---

    for i = 1:length(ambient_temperatures)

        ambient_temperature_K = ambient_temperatures(i); 
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
        stop_time = currentData(end,1);
        in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));
    
        % Run initialization simulation
        simout = sim(in);
    
        % Save the results
        target_id = sprintf('doe%d',i);
        is_qnovo_format = 1;
        sampling_rate_s = 1;
        extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, sampling_rate_s);
        
    end
end
