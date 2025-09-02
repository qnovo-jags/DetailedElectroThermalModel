function plotPackIVwithMeasured(simOut, csvFile, exportDir)
% plotPackIVwithMeasured  Plot pack current & voltage with measured overlays,
%                         add temperature comparison, and export simulated data to CSV.
%
%   plotPackIVwithMeasured(simOut, csvFile, exportDir)
%
%   simOut:    Simscape simulation output with logging for 'Cycler'
%   csvFile:   Path to measured data CSV
%   exportDir: Folder where simulation CSVs will be saved
%
%   Example:
%       simOut    = sim('mainModelNew');
%       csvFile   = './Data_241211/cleaned_data.csv';
%       exportDir = './SimExports';
%       plotPackIVwithMeasured(simOut, csvFile, exportDir);

    % --- Simulated data (I/V) ---
    iData   = simOut.simlog.Cycler.i.series.values;
    vData   = simOut.simlog.Cycler.v.series.values;
    timeSim = simOut.simlog.Cycler.i.series.time;

    % Export simulated I/V data
    if nargin >= 3 && ~isempty(exportDir)
        if ~isfolder(exportDir)
            mkdir(exportDir);
        end
        simDataTable = table(timeSim, iData, vData, ...
            'VariableNames', {'Time_s', 'Current_A', 'Voltage_V'});
        exportFile = fullfile(exportDir, ['SimData_' datestr(now,'yyyymmdd_HHMMSS') '.csv']);
        writetable(simDataTable, exportFile);
        fprintf('Simulated I/V data exported to: %s\n', exportFile);
    end

    % --- Simulated temperature (from ThermalMassBatteries1) ---
    simlog = simOut.simlog;
    blockName = sprintf('ThermalMassBatteries%d', 1);
    T_sim    = simlog.(blockName).M.T.series.values; % temperature values
    tT_sim   = simlog.(blockName).M.T.series.time;   % time (s)

    % --- Measured data ---
    T = readtable(csvFile, 'VariableNamingRule', 'preserve');

    % Voltage column (measured)
    vCol = "[BMS] Battery DC Voltage (V)";
    if ~ismember(vCol, T.Properties.VariableNames)
        cand = find(contains(T.Properties.VariableNames, "Battery", 'IgnoreCase', true) & ...
                    contains(T.Properties.VariableNames, "Voltage", 'IgnoreCase', true), 1);
        if isempty(cand)
            error("Could not find measured voltage column. Expected '%s'.", vCol);
        end
        vCol = T.Properties.VariableNames{cand};
    end
    vMeasured = T.(vCol);

    % Current column (measured)
    iCol = "[BMS] Battery Current (A)";
    if ~ismember(iCol, T.Properties.VariableNames)
        candI = find(contains(T.Properties.VariableNames, "Battery", 'IgnoreCase', true) & ...
                     contains(T.Properties.VariableNames, "Current", 'IgnoreCase', true), 1);
        if isempty(candI)
            error("Could not find measured current column. Expected '%s'.", iCol);
        end
        iCol = T.Properties.VariableNames{candI};
    end
    iMeasured = T.(iCol);

    % Temperature column (measured) -> any column containing "[BMS] Battery Pack B01"
    matchMask = contains(T.Properties.VariableNames, "[BMS] Battery Pack B01", 'IgnoreCase', true);
    if any(matchMask)
        tColNames = T.Properties.VariableNames(matchMask);
        measTempCol = tColNames{1};   % take first match
        T_measured = T.(measTempCol);
    else
        warning('No measured temperature column found containing "[BMS] Battery Pack B01". Skipping measured temperature plot.');
        T_measured = [];
    end

    % Time column handling (measured)
    if ~ismember("time", T.Properties.VariableNames)
        error("Could not find 'time' column in the CSV.");
    end
    tcol = T.time;
    if isdatetime(tcol) || isduration(tcol)
        timeSec = seconds(tcol - tcol(1));
    else
        tstr = string(tcol);
        tdur = duration(tstr, 'InputFormat', 'hh:mm:ss.SSS');
        timeSec = seconds(tdur - tdur(1));
    end

    % --- Plot ---
    figure('Name','Pack Current, Voltage & Temperature','NumberTitle','off');

    % 1) Current (simulated + measured)
    subplot(3,1,1);
    plot(timeSim, iData, 'b', 'LineWidth', 1.5, 'DisplayName','Interpolated');
    hold on;
    scatter(timeSec, iMeasured, 12, 'r', 'filled', 'DisplayName','Measured');
    xlabel('Time (s)');
    ylabel('Current (A)');
    title('Pack Current (Interpolated vs Measured)');
    legend('show', 'Location', 'best');
    grid on;

    % 2) Voltage (simulated + measured)
    subplot(3,1,2);
    plot(timeSim, vData, 'b', 'LineWidth', 1.5, 'DisplayName','Simulated');
    hold on;
    scatter(timeSec, vMeasured, 12, 'r', 'filled', 'DisplayName','Measured');
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    title('Pack Voltage (Sim vs Measured)');
    legend('show', 'Location', 'best');
    grid on;

    % 3) Temperature (simulated + measured if available)
    subplot(3,1,3);
    plottedSomething = false;
    if ~isempty(T_sim)
        plot(tT_sim, T_sim - 273, 'b', 'LineWidth', 1.5, 'DisplayName','Simulated');
        plottedSomething = true;
        hold on;
    end
    if ~isempty(T_measured)
        scatter(timeSec, T_measured, 12, 'r', 'filled', 'DisplayName','Measured');
        plottedSomething = true;
    end
    xlabel('Time (s)');
    ylabel('Temperature (°C)');
    title('Battery Temperature (Sim vs Measured)');
    if plottedSomething
        legend('show', 'Location', 'best');
    else
        text(0.5, 0.5, 'No temperature data available', 'HorizontalAlignment','center');
    end
    grid on;

end
