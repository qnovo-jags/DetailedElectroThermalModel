function plotVITforDOE(DOE_ID)
% plotAllVoltages Plots voltage vs. time for each module's parallel assembly,
% and the current cycle in a second subplot.
%
% Inputs:
%   DOE_ID - ID of DOE configuration (e.g., 1)

    resultsFolder = sprintf("./Results/DOE%d", DOE_ID);

    figure;

    %% --- Subplot 1: Voltages ---
    ax1 = subplot(3,1,1);   % 2 rows, 1 column, top plot
    hold on;
    for i = 1:32
        moduleFolder = fullfile(resultsFolder, sprintf('Module%d', i));
        
        for pAssembly = 1:6
            % Construct path to the CSV file
            filename = fullfile(moduleFolder, sprintf('Data%d.csv', pAssembly));
            
            if exist(filename, 'file')
                data = readmatrix(filename);
                
                time_series = data(:, 1);
                v_series    = data(:, 2);
                
                % Plot voltage trace
                plot(time_series, v_series, 'DisplayName', ...
                     sprintf('M%d-A%d', i, pAssembly));
            else
                warning('File not found: %s', filename);
            end
        end
    end
    title('Voltages of Series Elements');
    ylabel('SE Voltage (V)');
    grid on;
    box on; 
    hold off;

    %% --- Subplot 2: Current ---
    ax2 = subplot(3,1,2);   % 2 rows, 1 column, bottom plot
    load("DOE_configs.mat", "DOE");
    currentCycle = cycleSampler(DOE(DOE_ID).Qnom, ...
                                DOE(DOE_ID).samplingFreq, ...
                                DOE(DOE_ID).RestTime1, ...
                                DOE(DOE_ID).chargeRate, ...
                                DOE(DOE_ID).RestTime2);
    plot(currentCycle(:,1), currentCycle(:,2), 'r'); % 
    title('Current Profile');
    xlabel("Time (s)");
    ylabel("Current (A)");
    grid on;
    box on; 

    %% --- Subplot 3: Temperatures ---
    ax3 = subplot(3,1,3);
    hold on;
    for i = 1:32
        % Temperature CSV stored as ./Results/DOE<ID>/Data<i>.csv
        filename = fullfile(resultsFolder, sprintf('Data%d.csv', i));
        if exist(filename, 'file')
            data = readmatrix(filename);
            time_series = data(:,1);
            T_series    = data(:,2);
            plot(time_series, T_series);
        end
    end
    title('Module Temperatures');
    xlabel("Time (s)");
    ylabel("Temperature (K)");
    grid on; 
    box on; 
    hold off;

    %% --- Link x-axes ---
    linkaxes([ax1, ax2, ax3], 'x');
    xlim([0 max(currentCycle(:,1))]);

    exportgraphics(gcf, sprintf('./Figures/VoltagesCurrentsTemps_DOE%d.png', DOE_ID), 'Resolution', 600);
end
