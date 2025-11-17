% %% ------------------------------------------------------------------------
function customDoeFastRestartLoop(modelName, currentData, ambient_temperature_K, output_dir, num_cycles)
% run_doe_fast_restart_loop
% Runs all DOEs in a filtered run_sequence using Fast Restart and extracts data
%
% Inputs:
%   modelName        - Name of Simulink model
%   myDOE            - Full DOE struct array
%   target_sequence  - Run sequence number
%   CellNominalCapacityAh
%   numParallelCells
%   numModules       - Number of modules
%   output_dir       - Folder to save CSVs
%
% Outputs:
%   simulation_results - Struct with DOE IDs as fields containing extracted data


    % Enable Fast Restart
    set_param(modelName, 'FastRestart', 'on');

    for cycle = 1:num_cycles

        doeTimer = tic;

        % Assign currentData to base workspace
        assignin("base", "currentData", currentData);

        % Setup simulation input
        in = Simulink.SimulationInput(modelName);
        in = in.setVariable('AmbientTemperature', ambient_temperature_K);

        stop_time = currentData(end,1);
        in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));

        % Run simulation
        simout = sim(in);

        % Extract SE data and save CSVs
        % Save the results
        target_id = sprintf('doe%d', cycle);
        is_qnovo_format = 1;
        sampling_rate_s = 1;
        extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, sampling_rate_s);

        fprintf("%s completed and saved.", target_id);
        fprintf(" in %.2f seconds\n", toc(doeTimer));
    end
end