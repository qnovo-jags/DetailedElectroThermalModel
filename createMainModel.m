%This file creates the electrical and thermal coupled model in Simulink

clc
%clear all;
close all;
run("BatteryGeneration/ev_pack_cell_parameters.m")
modelName = 'mainModelDOE';

if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);
load_system(modelName)

createElectricalModel

load_system('./coolantFlow_lib.slx')
createThermalModel

electricalToThermal(modelName)
thermalToElectrical(modelName)

set_param(modelName, 'SimscapeLogType', 'all')  

% set_param(modelName, 'FastRestart', 'on');

set_param(modelName, 'FastRestart', 'off');
set_param(modelName, 'StartTime', '0', 'StopTime', '10000');

save_system(modelName, sprintf("%s.slx",modelName))
