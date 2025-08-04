clc
%clear all 
close all

%dateData = "20250731";

%Constants
KtoC = 273; 
CpModule = 1000;
CpCoolant = 3400;
rhoCoolant = 1000;
ACoolant = 2e-5;

IONIQ_parameters2_param

%Tunable parameters
scaledMassCoolant = 0.8; %Tuneable parameter
massCoolantScale = 0.003;  

scaledAdvectiveCoefficient = 1.2; %Tuneable parameter
advectiveCoefficientScale = 100;

scaledMassModule = 1.2; %Tuneable parameter
massModuleScale = 11;

thermalResistanceModuleToAmbient_0 = 3;
thermalResistanceModuleToAmbient_1 = 0.5;
thermalResistanceModuleToAmbient_2 = 1;
thermalResistanceModuleToAmbient_3 = 1.5;

thermalResistanceTubeToModule = 0.5;

out = getInputsByCase(dateData);
AmbientTemperature = out{4};
coolantTempSourceTemperature = AmbientTemperature;

thermalMassModule = CpModule * massModule;
thermalMassCoolantChannel = CpCoolant * massCoolant;  

tic

out = getInputsByCase(dateData);
currentData = out{2};

modelName = 'mainModel';
open_system(modelName);
simOut = sim(modelName);

simlog = simscape.logging.getSimulationLog(modelName);

toc
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

%batteryTemperaturePlots2(T_all, time_series)

