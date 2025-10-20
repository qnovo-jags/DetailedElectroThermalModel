% %% ------------------------------------------------------------------------
function doe_run_loop(modelName, myDOE, target_sequence, ...
                      CellNominalCapacityAh, numParallelCells, ...
                      output_dir, is_qnovo_format)
% Runs all DOEs in a run sequence using specified simulation mode
%
% Inputs:
%   simMode - 'normal', 'accelerator', or 'rapid'

    filtered_DOE = myDOE([myDOE.run_sequence] == target_sequence);
    simulation_results = struct();

    % Enable Fast Restart only if mode is not 'rapid'
    set_param(modelName,'FastRestart','on');

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
                                        selectedDOE.depth_of_discharge);

        assignin('base','currentData',currentData);

        % Simulation input
        in = Simulink.SimulationInput(modelName);
        in = in.setVariable('AmbientTemperature', selectedDOE.ambient_temperature_K);
        stop_time = currentData(end,1);
        in = in.setModelParameter('StartTime','0','StopTime',num2str(stop_time));

        % Run simulation in selected mode
        simOut = sim(in);

        % Extract SE data and save CSVs
        simulation_results.(target_id) = extractSEDataProbe(simOut, output_dir, ...
                                                            target_id, is_qnovo_format, ...
                                                            selectedDOE.sampling_rate_s);

        fprintf("DOE %s completed in %.2f seconds\n", ...
                target_id, toc(doeTimer));
    end
end