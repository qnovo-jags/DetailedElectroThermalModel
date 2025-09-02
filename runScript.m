clc

close all
tic

run("./constant_parameters.m")

run('./BatteryGeneration/thermalCoupled_param.m')

out = getInputsByCase(dateData);
Module1.socCell = out{1};
currentData = out{2};
AmbientTemperature = out{4};
Module1.batteryTemperature = out{4};
%coolantTempSourceTemperature = out{4};

%Tunable parameters
% scaledMassModule = 0.9;
% scaledMassCoolant = 0.65; 
% scaledAdvectiveCoefficient = 1; 
% thermalResistanceModuleToAmbient_0 = 2.91;
% thermalResistanceModuleToAmbient_1 = 0.28;
% thermalResistanceModuleToAmbient_2 = 1.17;
% thermalResistanceModuleToAmbient_3 = 1.59;
% thermalResistanceTubeToModule = 0.55;
% scaledCoolantTemp = 1;

% scaledMassModule = 1.2075;
% scaledMassCoolant = 0.72181; 
% scaledAdvectiveCoefficient = 0.82224; 
% thermalResistanceModuleToAmbient_0 = 2.1073;
% thermalResistanceModuleToAmbient_1 = 0.46324;
% thermalResistanceModuleToAmbient_2 = 0.9483;
% thermalResistanceModuleToAmbient_3 = 1.4345;
% thermalResistanceTubeToModule = 0.51219;
% scaledCoolantTemp = 0.97198;

scaledMassModule = 0.8;
scaledMassCoolant = 4.8509; 
scaledAdvectiveCoefficient = 4.5932; 
thermalResistanceModuleToAmbient_0 = 1.0269;
thermalResistanceModuleToAmbient_1 = 0.51832;
thermalResistanceModuleToAmbient_2 = 1.1982;
thermalResistanceModuleToAmbient_3 = 2.4342;
thermalResistanceTubeToModule = 0.5;
scaledCoolantTemp = 0.9803;

% scaledMassModule = 0.76866;
% scaledMassCoolant = 4.407; 
% scaledAdvectiveCoefficient = 4.1231; 
% thermalResistanceModuleToAmbient_0 = 1.8947;
% thermalResistanceModuleToAmbient_1 = 0.52539;
% thermalResistanceModuleToAmbient_2 = 0.79929;
% thermalResistanceModuleToAmbient_3 = 3.83;
% thermalResistanceTubeToModule = 0.52909;
% scaledCoolantTemp = 0.98304;
tic

modelName = 'mainModelNew';
open_system(modelName);
simOut = sim(modelName);

simlog = simscape.logging.getSimulationLog(modelName);

toc
%%
% Loop through all 32 battery blocks
numModules = 32;

for i = 1:numModules
    blockName = sprintf('ThermalMassBatteries%d', i);
    T_series = simlog.(blockName).M.T.series.values;
    time_series = simlog.(blockName).M.T.series.time;

    % Save CSV
    data_matrix = [time_series(:), T_series(:)];

    folderPath = sprintf('./Results/%s', dateData);
    filename = sprintf('%s/Data%d.csv', folderPath, i);
    
    % Create the folder if it doesn't exist
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
    
    % Write the matrix to the file
    writematrix(data_matrix, filename);
end

%batteryTemperaturePlots2(T_all, time_series)

%plotAllModuleTemperatures()

%%
plotPackIVwithMeasured(simOut, out{5}, "./simResults/")


