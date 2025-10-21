%This file creates the electrical and thermal coupled model in Simulink

clc
clear;
close all;


run("BatteryGeneration/ev_pack_cell_parameters.m")
modelName = 'mainModelDoeJF';
numModules = 32;

if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);
load_system(modelName);

createElectricalModel

load_system('./utils/coolantFlow_lib.slx')
createThermalModel

electricalToThermal(modelName);
thermalToElectrical(modelName);

addProbesSubsystemGrid(modelName, numModules);

set_param(modelName, 'SimscapeLogType', 'all')  
set_param(modelName, 'FastRestart', 'off');
set_param(modelName, 'StartTime', '0', 'StopTime', '1000');

save_dir = fullfile(pwd, 'simulinkModels');  % or use absolute path
if ~exist(save_dir, 'dir')
    mkdir(save_dir);
end

save_system(modelName, fullfile(save_dir, sprintf('%s.slx', modelName)));



