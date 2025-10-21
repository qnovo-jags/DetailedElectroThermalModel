

%% --- Setup paths ---

PACK_ID = 2;
common_path = sprintf('sypack192s2p60ah/SYPACK%d/metadata', PACK_ID);
if ~exist(common_path, 'dir')
    mkdir(common_path);
end

% %% --- 1. Save cell_parameters.json ---

cell_param = ev_pack_cell_parameters();  % fixed cell parameters

cellParamFile = fullfile(common_path, 'cell_parameters.json');
fid = fopen(cellParamFile, 'w');
fprintf(fid, '%s', jsonencode(cell_param));
fclose(fid);
fprintf('Saved cell parameters JSON: %s\n', cellParamFile);

% %% Pack Parameters - Architechture and Thermal

SYPACK(PACK_ID).num_series_elements = 192;
SYPACK(PACK_ID).num_parallel_elements = 2;
SYPACK(PACK_ID).se_resistance_adjustments_ohm = zeros(192,1);

SYPACK(PACK_ID).numCellsPerModule = 12;
SYPACK(PACK_ID).numModules = 32;

SYPACK(PACK_ID).temperature_ref_K = 273.15 + 25;
SYPACK(PACK_ID).r_bol_soc_ranges_frac = [0.20, 0.75];

SYPACK(PACK_ID).AmbientTemperature = SYPACK(PACK_ID).temperature_ref_K; % Kelvin
SYPACK(PACK_ID).scaledMassModule = 0.8;
SYPACK(PACK_ID).scaledMassCoolant = 4.8509; 
SYPACK(PACK_ID).scaledAdvectiveCoefficient = 4.5932; 
SYPACK(PACK_ID).thermalResistanceModuleToAmbient_0 = 1.0269;
SYPACK(PACK_ID).thermalResistanceModuleToAmbient_1 = 0.51832;
SYPACK(PACK_ID).thermalResistanceModuleToAmbient_2 = 1.1982;
SYPACK(PACK_ID).thermalResistanceModuleToAmbient_3 = 2.4342;
SYPACK(PACK_ID).thermalResistanceTubeToModule = 0.5;
SYPACK(PACK_ID).scaledCoolantTemp = 0.9803;

% %% --- 2. Save pack_parameters.json ---
pack_params = SYPACK(PACK_ID);
packParamFile = fullfile(common_path, 'pack_parameters.json');
fid = fopen(packParamFile, 'w');
fprintf(fid, '%s', jsonencode(pack_params));
fclose(fid);
fprintf('Saved pack parameters JSON: %s\n', packParamFile);

%% Pack damage information

% =========================================
% Define health condition distributions
% =========================================
profiles = struct();

profiles.Healthy_BoL.BatteryCapacity.mean = 0;
profiles.Healthy_BoL.BatteryCapacity.std  = 0.1;
profiles.Healthy_BoL.R0.mean  = 0;
profiles.Healthy_BoL.R0.std   = 1;
profiles.Healthy_BoL.R1.mean  = 0;
profiles.Healthy_BoL.R1.std   = 1;
profiles.Healthy_BoL.Tau1.mean = 0;
profiles.Healthy_BoL.Tau1.std  = 1;
profiles.Healthy_BoL.SoC.mean  = 0;
profiles.Healthy_BoL.SoC.std   = 0.005;

profiles.Damaged_BoL.BatteryCapacity.mean = 0;
profiles.Damaged_BoL.BatteryCapacity.std  = 0.1;
profiles.Damaged_BoL.R0.mean  = 10;
profiles.Damaged_BoL.R0.std   = 5;
profiles.Damaged_BoL.R1.mean  = 10;
profiles.Damaged_BoL.R1.std   = 5;
profiles.Damaged_BoL.Tau1.mean = 10;
profiles.Damaged_BoL.Tau1.std  = 5;
profiles.Damaged_BoL.SoC.mean  = 0.02;
profiles.Damaged_BoL.SoC.std   = 0.01;

profiles.Healthy_Aged.BatteryCapacity.mean = -10;
profiles.Healthy_Aged.BatteryCapacity.std  = 2;
profiles.Healthy_Aged.R0.mean  = 5;
profiles.Healthy_Aged.R0.std   = 3;
profiles.Healthy_Aged.R1.mean  = 5;
profiles.Healthy_Aged.R1.std   = 3;
profiles.Healthy_Aged.Tau1.mean = 5;
profiles.Healthy_Aged.Tau1.std  = 3;
profiles.Healthy_Aged.SoC.mean  = 0;
profiles.Healthy_Aged.SoC.std   = 0.005;

profiles.Damaged_Aged.BatteryCapacity.mean = -15;
profiles.Damaged_Aged.BatteryCapacity.std  = 5;
profiles.Damaged_Aged.R0.mean  = 15;
profiles.Damaged_Aged.R0.std   = 5;
profiles.Damaged_Aged.R1.mean  = 15;
profiles.Damaged_Aged.R1.std   = 5;
profiles.Damaged_Aged.Tau1.mean = 15;
profiles.Damaged_Aged.Tau1.std  = 5;
profiles.Damaged_Aged.SoC.mean  = 0.03;
profiles.Damaged_Aged.SoC.std   = 0.01;

% Store the damage profile
SYPACK(PACK_ID).damage_profiles = profiles;

% =========================================
% Assign modules and cells per condition
% =========================================

if PACK_ID==1
    SYPACK(PACK_ID).module_condition_map = struct( ...
        'Damaged_BoL',  [2, 19], ...
        'Damaged_Aged', [4, 11] ...
    );
    % Damaged cells within each damaged module
    SYPACK(PACK_ID).damaged_cell_per_module_idxs_1_based = [1, 2];
elseif PACK_ID==2
    SYPACK(PACK_ID).module_condition_map = struct( ...
        'Healthy_BoL',  [2, 19] ...
    );
    % Damaged cells within each damaged module
    SYPACK(PACK_ID).damaged_cell_per_module_idxs_1_based = [];
end


% %% Initial SoC
SYPACK(PACK_ID).SocCell0   = 0.20;
file_path = fullfile(common_path, 'pack_config.mat');
save(file_path, 'SYPACK');
