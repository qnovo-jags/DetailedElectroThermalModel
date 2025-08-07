%This file creates the electrical model forward coupled with thermal model
clc
%clear all;
close all;

modelName = 'mainModel';

if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);
load_system(modelName)

load_system('coolantFlow_lib')

createElectricalModel

createThermalModel

load_system('algebraicManip_lib')

electricalToThermal(modelName)


for i = 1:32
    probePath = [modelName, sprintf('/TempProbeBlock%d', i)];
    targetBlock = [modelName, sprintf('/ThermalMassBatteries%d', i)];
    
    % Add probe block
    add_block('nesl_utility/Probe', probePath);
    add_block('simulink/Commonly Used Blocks/Terminator',sprintf('%s/Terminator%d', modelName, i))
    % Bind probe and set variable to probe
    simscape.probe.setBoundBlock(probePath, targetBlock);
    simscape.probe.setVariables(probePath, ["M.T"]);
    
    add_line(modelName, sprintf('TempProbeBlock%d/1', i), sprintf('Terminator%d/1', i))
    % Get output line handle
    portHandles = get_param(probePath, 'PortHandles');
    lineHandle = get_param(portHandles.Outport, 'Line');
    
    % Set custom signal name on the output line
    customSignalName = sprintf('T%d', i);
    set_param(lineHandle, 'Name', customSignalName);
end

set_param(modelName, 'SimscapeLogType', 'all')  

set_param(modelName, 'StartTime', '0', 'StopTime', '5000');
save_system(modelName, "mainModel.slx")
