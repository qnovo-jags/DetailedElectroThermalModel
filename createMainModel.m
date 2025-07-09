%This file creates the electrical model forward coupled with thermal model
clc
clear;
close all;

model_name = 'mainModel';
ref_model = 'electricalModel';

load_system(ref_model)
new_system(model_name)
open_system(model_name)

%add_block('simulink/Ports & Subsystems/Model', ...
%    [model_name, '/ElectricalSubsystem'], ...
%    'ModelName', ref_model);

solverBlock = [model_name, '/SolverConfig'];
add_block('nesl_utility/Solver Configuration', solverBlock);

cyclerBlock = [model_name, '/Cycler'];
add_block('batt_lib/Cyclers/Cycler', cyclerBlock);

constantCurrent = [model_name, '/ConstantCurrent'];
add_block('fl_lib/Physical Signals/Sources/PS Constant', constantCurrent)

constant1 = [model_name, '/Constant1'];
add_block('fl_lib/Physical Signals/Sources/PS Constant',constant1, ...
    "Position", [50, 100, 70, 120])

add_line(model_name, 'Constant1/RConn 1', 'Cycler/LConn 3')
add_line(model_name, 'ConstantCurrent/RConn 1', 'Cycler/LConn 1')