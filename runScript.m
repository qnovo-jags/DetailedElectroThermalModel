clc
%clear all 
close all

%Constants
KtoC = 273; 
CpModule = 1000;
CpCoolant = 3400;
rhoCoolant = 1000;
ACoolant = 2e-5;

IONIQ_parameters2_param
%%
%Tunable parameters
massCoolantScale = 0.003;
scaledMassCoolant = 1;

advectiveCoefficientScale = 100;
scaledAdvectiveCoefficient = 1;

thermalResistanceTubeToModule = 0.237;

thermalResistanceModuleToAmbient_0 = 5;
thermalResistanceModuleToAmbient_1 = 0.5;
thermalResistanceModuleToAmbient_2 = 5;
thermalResistanceModuleToAmbient_3 = 5;

massModule = 11;
massCoolant = 0.003;

coolantTempSourceTemperature = 300;
AmbientTemperature = 300;

%%
thermalMassModule = CpModule * massModule;
thermalMassCoolantChannel = CpCoolant * massCoolant;  

currentData = readmatrix("interpolated_current.csv");
%currentData = [(1:2000)', [-200 * ones(1000,1); zeros(1000,1)]];
modelName = 'mainModel';
open_system(modelName);
simOut = sim(modelName);

simlog = simscape.logging.getSimulationLog(modelName);

%%
% Initialize the figure
figure;
hold on;
grid on;

% Loop through all 32 battery blocks
numModules = 32;

for i = 1:numModules
    blockName = sprintf('ThermalMassBatteries%d', i);
    T_series = simlog.(blockName).M.T.series.values;
    time_series = simlog.(blockName).M.T.series.time;

    % Save CSV
    data_matrix = [time_series(:), T_series(:)];
    writematrix(data_matrix, sprintf('./Results/Data%d.csv', i));

    % Store in a matrix
    if i == 1
        N = length(time_series);           % number of time steps
        T_all = zeros(numModules, N);      % preallocate
    end

    T_all(i, :) = T_series(:);             % store temperature series
end

batteryTemperatureRelative(T_all, time_series)