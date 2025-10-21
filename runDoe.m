
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
project_dir = "./sypack192s2p60ah/SYPACK1";
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
%  LOAD DOE CONFIGURATION
%  ================================

doe_config_file = fullfile(metadata_dir, "doe_config.mat");
fprintf("Loading DOE configuration from: %s\n", doe_config_file);
load(doe_config_file, "DOE");
fprintf("Loaded DOE configuration for SYPACK%d successfully.\n", PACK_ID);

%% Run DOE and log results

% --- MASTER DOE RUN ---
is_qnovo_format = 1;  % 1: "[I1,I2,...]" format, 0 for expanded format
all_run_sequences = unique([DOE.run_sequence]);
totalTimer = tic;  % start total timer
mySYPACK = SYPACK;

for seqIdx = 1:length(all_run_sequences)
    
    % --- Identify the targer run sequence
    target_sequence = all_run_sequences(seqIdx);
    fprintf("\n=== Running sequence %d/%d ===\n", target_sequence, length(all_run_sequences));

    % % --- Initialize model for this run sequence
    initTimer = tic;
    doeInitialization(modelName, DOE, target_sequence, CellNominalCapacityAh, ...
        numParallelCells, mySYPACK);
    fprintf("Initialization completed in %.2f seconds\n", toc(initTimer));
    
    % --- Run fast restart loop to simulate all DOEs in this sequence
    loopTimer = tic;
    doeFastRestartLoop(modelName, DOE, target_sequence, ...
                                        CellNominalCapacityAh, numParallelCells, ...
                                        sim_dir, is_qnovo_format);
    fprintf("Completed run_sequence %d in %.2f seconds\n", target_sequence, toc(loopTimer));
end

fprintf("\nAll run_sequences completed successfully!\n");
fprintf("\nAll run_sequences completed successfully in %.2f seconds!\n", toc(totalTimer));
