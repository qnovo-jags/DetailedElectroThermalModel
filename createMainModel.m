%This file creates the electrical and thermal coupled model in Simulink

clc
%clear all;
close all;

modelName = 'mainModelNew';

if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);
load_system(modelName)

createElectricalModel

load_system('./coolantFlow_lib')
createThermalModel

load_system('./algebraicManip_lib')

electricalToThermal(modelName)
thermalToElectrical(modelName)

set_param(modelName, 'SimscapeLogType', 'all')  
set_param(modelName, 'StartTime', '0', 'StopTime', '10000');
%set_param(modelName, 'FastRestart', 'on');
save_system(modelName, "mainModelNew.slx")
