% %% ------------------------------------------------------------------------
function customDoeFastRestartLoop(modelName, myDOE, target_sequence, CellNominalCapacityAh, numParallelCells, output_dir)
    % run_doe_fast_restart_loop

    % Filter DOE for the run sequence
    filtered_DOE = myDOE([myDOE.run_sequence] == target_sequence);
    is_qnovo_format = 1;
    simulation_results = struct();

    % Enable Fast Restart
    set_param(modelName, 'FastRestart', 'on');

    for k = 1:length(filtered_DOE)
        selectedDOE = filtered_DOE(k);
        target_id = selectedDOE.doe_id;

        doeTimer = tic;

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

        % Setup simulation input
        in = Simulink.SimulationInput(modelName);
        in = in.setVariable('AmbientTemperature', ambient_temperature_K);
        stop_time = currentData(end,1);
        in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));

        % Run simulation
        simout = sim(in);

        % Extract SE data and save CSVs
        simulation_results.(target_id) = extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, selectedDOE.sampling_rate_s);

        fprintf("DOE %s completed and saved.\n", target_id);
        fprintf("DOE %d completed in %.2f seconds\n", length(filtered_DOE), toc(doeTimer));
    end
end