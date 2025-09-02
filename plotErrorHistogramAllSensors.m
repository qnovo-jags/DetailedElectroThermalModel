function allErrors = plotErrorHistogramAllSensors(dateData, plotFlag)
    
    if nargin < 2
        plotFlag = true;
    end

    % Map sensor IDs to module IDs
    j_vals = [1, 4, 5, 8, ...
              9, 12, 13, 16, ...
              17, 20, 21, 24, ...
              25, 28, 29, 32];

    allErrors = []; % To store error values from all sensors

    % Loop over all 16 sensors
    for sensorID = 1:16
        moduleID = j_vals(sensorID);

        % Get simulation and measurement data
        dataSim = getDataFromSimulations(moduleID, dateData);
        dataMeasured = getDataMeasurements(moduleID, dateData);

        % Ensure data is column vectors
        tSim = dataSim.Time(:);
        ySim = dataSim.Data(:);
        tMeas = dataMeasured.Time(:);
        yMeas = dataMeasured.Data(:);

        % --- Create common time base (1 Hz) ---
        t_start = ceil(max(min(tSim), min(tMeas)));
        t_end   = floor(min(max(tSim), max(tMeas)));
        t_uniform = (t_start:1:t_end)';

        if isempty(t_uniform)
            warning('Sensor %d: No overlapping time range, skipping.', sensorID);
            continue;
        end

        % Interpolate both to common time base
        ySim_interp = interp1(tSim, ySim, t_uniform, 'linear', NaN);
        yMeas_interp = interp1(tMeas, yMeas, t_uniform, 'linear', NaN);

        % Filter out NaNs
        valid_idx = ~isnan(ySim_interp) & ~isnan(yMeas_interp);
        ySim_interp = ySim_interp(valid_idx);
        yMeas_interp = yMeas_interp(valid_idx);

        % Skip if no valid data
        if isempty(ySim_interp)
            warning('Sensor %d: No valid interpolated data after filtering NaNs.', sensorID);
            continue;
        end

        % Compute error
        error_sensor = yMeas_interp - ySim_interp;

        % Append to allErrors
        allErrors = [allErrors; error_sensor]; %#ok<AGROW>
    end

    if plotFlag
        figure('Name', sprintf('Error Histogram - %s', dateData), 'NumberTitle', 'off');
        histogram(allErrors, 25, Normalization="probability");
        title(sprintf('Combined Error Histogram for All Sensors (%s)', dateData));
        xlabel('Measurement - Simulation');
        ylabel('Frequency');
        grid on;
    end
end
