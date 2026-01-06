

%% --- Setup paths ---

PACK_ID = 3;
starting_soc = 0.20; % 0.30, 0.40, 0.50 -> starting charge SOC is 0.10 less 

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

% Note: These are percentage deviations in RC cell model parameter

% Type 0: Healthy_BoL
profiles.Healthy_BoL.BatteryCapacity.mean = 0; % percent deviation
profiles.Healthy_BoL.BatteryCapacity.std  = 0.26; % percent deviation, 0.27% * 58.38 / 0.60
profiles.Healthy_BoL.R0.mean  = 0; % percent deviation
profiles.Healthy_BoL.R0.std   = 2.26; % percent deviation
profiles.Healthy_BoL.R1.mean  = 0; % percent deviation
profiles.Healthy_BoL.R1.std   = 0; % percent deviation
profiles.Healthy_BoL.Tau1.mean = 0; % percent deviation
profiles.Healthy_BoL.Tau1.std  = 0; % percent deviation
profiles.Healthy_BoL.SoC.mean  = 0; % absolute deviation
profiles.Healthy_BoL.SoC.std   = 0.003; % absolute deviation

% Type 1: Capacity lower by 1.9%
profiles.Damaged_Type1.BatteryCapacity.mean = -1.9; % percent deviation
profiles.Damaged_Type1.BatteryCapacity.std  = 0; % percent deviation
profiles.Damaged_Type1.R0.mean  = 0; % percent deviation
profiles.Damaged_Type1.R0.std   = 2.26; % percent deviation
profiles.Damaged_Type1.R1.mean  = 0; % percent deviation
profiles.Damaged_Type1.R1.std   = 0; % percent deviation
profiles.Damaged_Type1.Tau1.mean = 0; % percent deviation
profiles.Damaged_Type1.Tau1.std  = 0; % percent deviation
profiles.Damaged_Type1.SoC.mean  = 0; % absolute deviation
profiles.Damaged_Type1.SoC.std   = 0.003; % absolute deviation

% Type 2: Capacity lower by 0.95%
profiles.Damaged_Type2.BatteryCapacity.mean = -0.95; % percent deviation
profiles.Damaged_Type2.BatteryCapacity.std  = 0; % percent deviation
profiles.Damaged_Type2.R0.mean  = 0; % percent deviation
profiles.Damaged_Type2.R0.std   = 2.26; % percent deviation
profiles.Damaged_Type2.R1.mean  = 0; % percent deviation
profiles.Damaged_Type2.R1.std   = 0; % percent deviation
profiles.Damaged_Type2.Tau1.mean = 0; % percent deviation
profiles.Damaged_Type2.Tau1.std  = 0; % percent deviation
profiles.Damaged_Type2.SoC.mean  = 0; % absolute deviation
profiles.Damaged_Type2.SoC.std   = 0.003; % absolute deviation

% Type 3: Higher R0 by 14%
profiles.Damaged_Type3.BatteryCapacity.mean = 0; % percent deviation
profiles.Damaged_Type3.BatteryCapacity.std  = 0.26; % percent deviation
profiles.Damaged_Type3.R0.mean  = 14; % percent deviation
profiles.Damaged_Type3.R0.std   = 0; % percent deviation
profiles.Damaged_Type3.R1.mean  = 0; % percent deviation
profiles.Damaged_Type3.R1.std   = 0; % percent deviation
profiles.Damaged_Type3.Tau1.mean = 0; % percent deviation
profiles.Damaged_Type3.Tau1.std  = 0; % percent deviation
profiles.Damaged_Type3.SoC.mean  = 0; % absolute deviation
profiles.Damaged_Type3.SoC.std   = 0.003; % absolute deviation

% Type 4: Higher R0 by 7%
profiles.Damaged_Type4.BatteryCapacity.mean = 0; % percent deviation
profiles.Damaged_Type4.BatteryCapacity.std  = 0.26; % percent deviation
profiles.Damaged_Type4.R0.mean  = 7; % percent deviation
profiles.Damaged_Type4.R0.std   = 0; % percent deviation
profiles.Damaged_Type4.R1.mean  = 0; % percent deviation
profiles.Damaged_Type4.R1.std   = 0; % percent deviation
profiles.Damaged_Type4.Tau1.mean = 0; % percent deviation
profiles.Damaged_Type4.Tau1.std  = 0; % percent deviation
profiles.Damaged_Type4.SoC.mean  = 0; % absolute deviation
profiles.Damaged_Type4.SoC.std   = 0.003; % absolute deviation

% Type 5: SoC0 lower by 7%
profiles.Damaged_Type5.BatteryCapacity.mean = 0; % percent deviation
profiles.Damaged_Type5.BatteryCapacity.std  = 0.26; % percent deviation
profiles.Damaged_Type5.R0.mean  = 0; % percent deviation
profiles.Damaged_Type5.R0.std   = 2.26; % percent deviation
profiles.Damaged_Type5.R1.mean  = 0; % percent deviation
profiles.Damaged_Type5.R1.std   = 0; % percent deviation
profiles.Damaged_Type5.Tau1.mean = 0; % percent deviation
profiles.Damaged_Type5.Tau1.std  = 0; % percent deviation
profiles.Damaged_Type5.SoC.mean  = -0.07; % absolute deviation
profiles.Damaged_Type5.SoC.std   = 0; % absolute deviation

% Store the damage profile
SYPACK(PACK_ID).damage_profiles = profiles;

% =========================================
% Assign modules and cells per condition
% =========================================
SYPACK(PACK_ID).module_condition_map = struct( ...
    'Damaged_Type1', 2, ...
    'Damaged_Type2', 4, ...
    'Damaged_Type3', 11, ...
    'Damaged_Type4', 19, ...
    'Damaged_Type5', 25 ...
);
SYPACK(PACK_ID).damaged_cell_per_module_idxs_1_based = [1, 2];  


% %% Initial SoC
SYPACK(PACK_ID).SocCell0   = starting_soc;
file_path = fullfile(common_path, 'pack_config.mat');
save(file_path, 'SYPACK');


%%

cells_per_module = 12;                  % 12 cells per module
damaged_cell_idxs = SYPACK(PACK_ID).damaged_cell_per_module_idxs_1_based;  % 1-based
module_map = SYPACK(PACK_ID).module_condition_map;
all_damaged_indices = [];

damage_types = fieldnames(module_map);

for k = 1:length(damage_types)
    modules = module_map.(damage_types{k});
    for m = 1:length(modules)
        module_num = modules(m);  % 1-based module index
        % Compute global 1-based cell indices
        global_cells_1_based = (module_num-1)*cells_per_module + damaged_cell_idxs;
        all_damaged_indices = [all_damaged_indices, global_cells_1_based];
    end
end

% Remove duplicates and sort
all_damaged_indices = unique(all_damaged_indices);

% Convert 1-based cells to 0-based SEs (each SE = 2 cells)
damaged_SEs_0_based = floor((all_damaged_indices - 1) / 2);  % 0-based
damaged_SEs_0_based = unique(damaged_SEs_0_based);

disp('Damaged SE indices (0-based):');
disp(damaged_SEs_0_based);
