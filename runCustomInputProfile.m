
clc
clear 
close all

%% --- Load constants and setup ---

PACK_ID = 1;
CellNominalCapacityAh = 60;
numParallelCells = 2;
numModules = 32;
modelName = 'mainModelDoeJF';

% Set the directories
project_dir = sprintf("./sypack192s2p60ah/SYPACK%d",PACK_ID);
sim_dir = fullfile(project_dir, "simulations");
mat_dir = fullfile(sim_dir, "mat_format");  
metadata_dir = fullfile(project_dir, "metadata");  

%% ================================
%  LOAD PACK CONFIGURATION
%  ================================

run("./utils/constantThermalParameters.m")
config_file = fullfile(metadata_dir, "pack_config.mat");
fprintf("Loading pack configuration from: %s\n", config_file);
load(config_file, "SYPACK");
fprintf("Loaded configuration for SYPACK%d successfully.\n", PACK_ID);

%% ================================
% Load the custom current profile
% =================================

data_filePath = fullfile('./data', "hmc_poc_fast_1_cycles.csv");
% data_filePath = fullfile('./data', "hmc_poc_fast_10_cycles.csv");

data = readtable(data_filePath);

currentData = [round(data.time_s), round(data.se_currents_A)];  % 2-column matrix: first column = time,
% ambient_temperature_K = 25 + 273.15;

ambient_temperatures = 273.15 + [10, 15, 20, 25, 30, 35, 40];

%% Run DOE and log results

% --- MASTER DOE RUN ---
is_qnovo_format = 1;  % 1: "[I1,I2,...]" format, 0 for expanded format
totalTimer = tic;  % start total timer
mySYPACK = SYPACK(PACK_ID);

num_cycles = 1;

% % --- Initialize model for this run sequence
initTimer = tic;

customInitializationAndRun(modelName, currentData, ambient_temperatures, mySYPACK, sim_dir);
% customDoeFastRestartLoop(modelName, currentData, ambient_temperature_K, sim_dir, num_cycles)

fprintf("\nRun completed successfully in %.2f seconds!\n", toc(initTimer));

%%

% load("/Users/jagmohanfanshal/Desktop/Qnovo/matlab_repos/tech_team_pack_modeling/DetailedElectroThermalModel/sypack192s2p60ah/SYPACK1/simulations/mat_format/doe1.mat")
% simout = se_data.simout;

% data = simout.batteryTemperature_Module1;
data = simout.socCell_Module1;

plot(data.time, squeeze(data.signals.values));