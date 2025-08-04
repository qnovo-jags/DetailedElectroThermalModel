% Parameters
folderPath = './Results';  
numSensors = 16;
referenceIndex = 29;  % Use Data1.csv as reference sensor

% Position Matrix (can be customized by you)
% Each entry represents which sensor index to plot in each subplot
positionMatrix = [
    7 8 10 9;
     5 6 12 11;
      3  4  14  13;
      1  2  16  15
];

sensor_to_module = [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29, 32];
% Preallocate
Temps = cell(1, numSensors);
Times = cell(1, numSensors);

% Load data
for i = 1:32
    fileName = fullfile(folderPath, sprintf('Data%d.csv', i));
    data = readtable(fileName);

    % Assume column names are "Time" and "Temperature"
    Times{i} = data.Var1;
    Temps{i} = data.Var2;
end

% Use reference sensor
T_ref = Temps{referenceIndex};
t_ref = Times{referenceIndex};

% Plot in 4x4 grid
figure;
for row = 1:4
    for col = 1:4
        sensorIdx = sensor_to_module(positionMatrix(row, col));

        subplotIdx = (row - 1) * 4 + col;

        subplot(4, 4, subplotIdx);
        deltaT = Temps{sensorIdx} - T_ref;

        % Make sure time aligns (assumes same length)
        plot(t_ref, deltaT, 'LineWidth', 1.5);
        grid on;
        title(sprintf('Sensor %d - Ref %d', sensorIdx, referenceIndex));
        xlabel('Time');
        ylabel('ΔTemp (°C)');
    end
end

sgtitle('Temperature Difference (ΔT) vs Reference Sensor');
