function compareSimResultsWithMeasurements(dateDataList)

    % Map sensor IDs to module IDs
    j_vals = [1, 4, 5, 8, ...
              9, 12, 13, 16, ...
              17, 20, 21, 24, ...
              25, 28, 29, 32];

    % Define 4x4 sensor position matrix for subplot arrangement
    sensorPositionMatrix = [7 8 10 9;
                            5 6 12 11;
                            3 4 14 13;
                            1 2 16 15];

    % Loop through each dateData item
    for i = 1:numel(dateDataList)
        dateData = dateDataList(i);
        out = getInputsByCase(dateData);
        pathMeasurements = out{3}; %#ok<NASGU> % if unused, suppress warning
        pathSimulation = sprintf("./Results/%s", dateData); %#ok<NASGU>

        % Create a new figure for this date
        figure('Name', sprintf('Comparison for %s', dateData), 'NumberTitle', 'off');

        % Loop over all 16 sensors
        for sensorID = 1:16
            moduleID = j_vals(sensorID);

            % Get simulation and measurement data
            dataSim = getDataFromSimulations(moduleID, dateData);
            dataMeasured = getDataMeasurements(moduleID, dateData);

            % Determine subplot position from sensorPositionMatrix
            [row, col] = find(sensorPositionMatrix == sensorID);
            subplotPosition = (row - 1) * 4 + col;

            % Create subplot
            subplot(4, 4, subplotPosition);

            % Plot simulated and measured data
            plot(dataSim.Time, dataSim.Data, 'b-', 'DisplayName', 'Simulation');
            hold on
            plot(dataMeasured.Time, dataMeasured.Data, 'r--', 'DisplayName', 'Measurement');
            
            xlim([min(dataMeasured.Time), max(dataMeasured.Time)])
            % Style
            title(sprintf('Sensor %d (Module %d)', sensorID, moduleID));

            grid on;
            xlabel('Time');
            ylabel('Value');
        end
                    legend('Location', 'best');
    end
end
