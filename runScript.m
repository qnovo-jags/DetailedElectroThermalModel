clc
%clear all 
close all

KtoC = 273;

currentDraw = 20;

%advectiveCoefficient = 10;

thermalResistanceTubeToModule = 0.1;

thermalResistanceModuleToAmbient_0 = 1;
thermalResistanceModuleToAmbient_1 = 1;
thermalResistanceModuleToAmbient_2 = 1;
thermalResistanceModuleToAmbient_3 = 1;

massModule = 1;
CpModule = 1000;
thermalMassModule = CpModule * massModule;

CpCoolant = 3400;
massCoolant = 0.003;
thermalMassCoolantChannel = CpCoolant * massCoolant;  

coolantTempSourceTemperature = 300;
AmbientTemperature = 305;currentDraw = 20;

advectiveCoefficient = 1000;

thermalResistanceTubeToModule = 0.1;

thermalResistanceModuleToAmbient_0 = 1;
thermalResistanceModuleToAmbient_1 = 1;
thermalResistanceModuleToAmbient_2 = 1;
thermalResistanceModuleToAmbient_3 = 1;

massModule = 1;
CpModule = 1000;
thermalMassModule = CpModule * massModule;

CpCoolant = 3400;
massCoolant = 0.003;
thermalMassCoolantChannel = CpCoolant * massCoolant;  

coolantTempSourceTemperature = 300;
AmbientTemperature = 300;

currentData = readmatrix("interpolated_current.csv");
modelName = 'mainModel';
open_system(modelName);
simOut = sim(modelName);

simlog = simscape.logging.getSimulationLog(modelName);

%%
% Extract temperature values and time from the logged series
KtoC = 273.15;  % Kelvin to Celsius

plotIndices = [29, 1, 13, 17];

% Initialize the figure
figure;
hold on;
grid on;

% Loop through all 32 battery blocks
for i = 1:32
    % Build dynamic Simulink signal path
    blockName = sprintf('ThermalMassBatteries%d', i);
    T_series = simlog.(blockName).M.T.series.values;
    time_series = simlog.(blockName).M.T.series.time;

    % Save data to CSV
    data_matrix = [time_series(:), T_series(:)];
    writematrix(data_matrix, sprintf('./Results/Data%d.csv', i));

    % Plot only selected indices
    if ismember(i, plotIndices)
        plot(time_series, T_series-KtoC, 'DisplayName', sprintf('Battery %d', i));
    end
end

% Finalize the plot
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature vs Time for Selected Batteries');
legend('show');