%This file creates the electrical model forward coupled with thermal model
clc
clear all;
close all;

modelName = 'mainModel';

if bdIsLoaded(modelName)
    close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);

load_system('coolantFlow_lib')

createElectricalModel

solverBlock = [modelName, '/SolverConfig'];
add_block('nesl_utility/Solver Configuration', solverBlock,...
    "Position", [150, 100, 200, 120]);

cyclerBlock = [modelName, '/Cycler'];
add_block('batt_lib/Cyclers/Cycler', cyclerBlock);

constantCurrent = [modelName, '/ConstantCurrent'];
add_block('fl_lib/Physical Signals/Sources/PS Constant', constantCurrent)

constant1 = [modelName, '/Constant1'];
add_block('fl_lib/Physical Signals/Sources/PS Constant',constant1, ...
    "Position", [50, 100, 70, 120])

add_line(modelName, 'Constant1/RConn 1', 'Cycler/LConn 3')
add_line(modelName, 'ConstantCurrent/RConn 1', 'Cycler/LConn 1')

add_line(modelName, 'Cycler/RConn 1', 'Module1/LConn 1', 'autorouting', 'on')
add_line(modelName, 'Cycler/RConn 2', 'Module32/RConn 1', 'autorouting', 'on')

add_block('fl_lib/Electrical/Electrical Elements/Electrical Reference', ...
    [modelName '/ElectricalRef'], ...
    'Position', [680, 800, 700,820]);

add_line(modelName, 'ElectricalRef/LConn 1', 'Module32/RConn 1')
add_line(modelName, 'SolverConfig/RConn 1', 'Cycler/RConn 2')

createThermalModel

load_system('algebraicManip_lib')

electricalToThermal(modelName)