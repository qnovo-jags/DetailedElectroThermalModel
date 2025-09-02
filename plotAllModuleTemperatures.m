function plotAllModuleTemperatures()
% plotModuleTemperaturesFromCSV - Reads all ./Results/Data*.csv files and plots them

    folderPath = './Results';
    files = dir(fullfile(folderPath, 'Data*.csv'));

    if isempty(files)
        error('No CSV files found in %s', folderPath);
    end

    figure;
    hold on;

    for i = 1:length(files)
        filePath = fullfile(folderPath, files(i).name);
        data = readmatrix(filePath);  % assumes [time, temperature] format

        if size(data, 2) < 2
            warning('File %s does not contain expected [time, temp] data.', files(i).name);
            continue;
        end

        time = data(:, 1);
        temp = data(:, 2);

        plot(time, temp, 'DisplayName', sprintf('Module %d', i));
    end

    hold off;
    xlabel('Time (s)');
    ylabel('Temperature (K)');
    title('Battery Module Temperatures Over Time');
    legend('show', 'Location', 'bestoutside');
    grid on;
end
