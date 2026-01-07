
clc
clear 
close all

%% --- Load constants and setup ---

PACK_ID = 5;
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
% % Load the custom current profile
% % =================================
% 
% data_filePath = fullfile('./data', "hmc_poc_fast_1_cycles.csv");
% data = readtable(data_filePath);
% fastcurrentData = [round(data.time_s), round(data.se_currents_A)];  % 2-column matrix: first column = time,
% 
doe_config_file = fullfile(metadata_dir, "doe_config.mat");
fprintf("Loading DOE configuration from: %s\n", doe_config_file);
load(doe_config_file, "DOE");
fprintf("Loaded DOE configuration for SYPACK%d successfully.\n", PACK_ID);

%% Run DOE and log results

% --- MASTER DOE RUN ---
is_qnovo_format = 1;  % 1: "[I1,I2,...]" format, 0 for expanded format
totalTimer = tic;  % start total timer
mySYPACK = SYPACK(PACK_ID);
all_run_sequences = unique([DOE.run_sequence]);
num_cycles = 1;

for seqIdx = 1:length(all_run_sequences)
    
    % --- Identify the targer run sequence
    target_sequence = all_run_sequences(seqIdx);
    fprintf("\n=== Running sequence %d/%d ===\n", target_sequence, length(all_run_sequences));

    % % --- Initialize model for this run sequence
    initTimer = tic;
    customInitializationAndRun(modelName, DOE, target_sequence, mySYPACK, sim_dir, PACK_ID);
    fprintf("Initialization completed in %.2f seconds\n", toc(initTimer));
    
    % --- Run fast restart loop to simulate all DOEs in this sequence
    loopTimer = tic;
    customDoeFastRestartLoop(modelName, DOE, target_sequence, CellNominalCapacityAh, numParallelCells, sim_dir);
    fprintf("Completed run_sequence %d in %.2f seconds\n", target_sequence, toc(loopTimer));
    
end

fprintf("\nRun completed successfully in %.2f seconds!\n", toc(initTimer));
