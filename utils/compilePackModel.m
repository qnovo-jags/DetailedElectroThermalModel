function [Modules, capacity_devs, r0_devs, r1_devs, tau1_devs, soc0s] = compilePackModel(SYPACKS, target_ambient_temp, PACK_ID)
%COMPILEPACKMODEL Generate module structs and DOE deviations for Simulink
%
% Inputs:
%   SYPACKS : Struct containing all pack parameters, including damaged cell info and percent deviations
%   target_ambient_temp: Constant ambient temperature for the pack
%   PACK_ID: Select an specific pack ID from the SYPACK struct
%
% Outputs:
%   Modules      : 1 x numModules struct array with all module parameters
%   capacity_devs: numModules x numCells matrix of capacity deviations
%   r0_devs      : numModules x numCells matrix of R0 deviations
%   r1_devs      : numModules x numCells matrix of R1 deviations
%   tau1_devs    : numModules x numCells matrix of Tau1 deviations
%   soc0s        : numModules x numCells matrix of initial SOC deviations

numCells    = 12;
numParallel = 6;
numModules  = 32;
numCycles   = 1;

fields = { "scaledMassModule",...
    "scaledMassCoolant", ...
    "scaledAdvectiveCoefficient", ...
    "thermalResistanceModuleToAmbient_0", ...
    "thermalResistanceModuleToAmbient_1", ...
    "thermalResistanceModuleToAmbient_2", ...
    "thermalResistanceModuleToAmbient_3", ...
    "thermalResistanceTubeToModule", ...
    "scaledCoolantTemp",...
     "AmbientTemperature"};

SYPACK = SYPACKS(PACK_ID);
for i = 1:numel(fields)
    assignin("base", fields{i}, SYPACK.(fields{i}));
end

% Get fixed cell parameters
cell_param = ev_pack_cell_parameters();

% Preallocate deviation matrices
capacity_devs = zeros(numModules, numCells);
r0_devs       = zeros(numModules, numCells);
r1_devs       = zeros(numModules, numCells);
tau1_devs     = zeros(numModules, numCells);
soc0s         = zeros(numModules, numCells);

% Fix seed for reproducibility
rng(123);

% Helper: Gaussian deviations
generateDeviations = @(n, meanVal, stdVal) meanVal + stdVal .* randn(n,1);

% Loop through modules
for module = 1:numModules
    % Assign fixed cell parameters
    Modules(module).BatteryCapacityCell = cell_param.BatteryCapacityCell;
    Modules(module).SOCBreakpointsCell = cell_param.SOCBreakpointsCell;
    Modules(module).TemperatureBreakpointsCell = cell_param.TemperatureBreakpointsCell;
    Modules(module).OpenCircuitVoltageThermalCell = cell_param.OpenCircuitVoltageThermalCell;
    Modules(module).VoltageRangeCell = cell_param.VoltageRangeCell;
    Modules(module).ResistanceSOCBreakpointsCell = cell_param.ResistanceSOCBreakpointsCell;
    Modules(module).ResistanceTemperatureBreakpointsCell = cell_param.ResistanceTemperatureBreakpointsCell;
    Modules(module).R0ThermalCell = cell_param.R0ThermalCell;
    Modules(module).R1ThermalCell = cell_param.R1ThermalCell;
    Modules(module).Tau1ThermalCell = cell_param.Tau1ThermalCell;
    Modules(module).BatteryThermalMassCell = 0.01;
    Modules(module).AmbientResistance = 0;

    % Default profile for all cells
    healthyProf = SYPACK.damage_profiles.Healthy_BoL;
    
    % Generate deviations for all cells as Healthy_BoL first
    capacity_dev = generateDeviations(numCells, healthyProf.BatteryCapacity.mean, healthyProf.BatteryCapacity.std);
    r0_dev       = generateDeviations(numCells, healthyProf.R0.mean, healthyProf.R0.std);
    r1_dev       = generateDeviations(numCells, healthyProf.R1.mean, healthyProf.R1.std);
    tau1_dev     = generateDeviations(numCells, healthyProf.Tau1.mean, healthyProf.Tau1.std);
    soc0         = SYPACK.SocCell0 + generateDeviations(numCells, healthyProf.SoC.mean, healthyProf.SoC.std);
    
    % Loop over each profile in module_condition_map
    profile_names = fieldnames(SYPACK.module_condition_map);
    for k = 1:numel(profile_names)
        modules_in_profile = SYPACK.module_condition_map.(profile_names{k});
        if ismember(module, modules_in_profile)
            % Only override the cells listed in damaged_cell_per_module_idxs_1_based
            prof_override = SYPACK.damage_profiles.(profile_names{k});
            damaged_cells = SYPACK.damaged_cell_per_module_idxs_1_based;
            for c = 1:length(damaged_cells)
                cell_idx = damaged_cells(c);
                capacity_dev(cell_idx) = generateDeviations(1, prof_override.BatteryCapacity.mean, prof_override.BatteryCapacity.std);
                r0_dev(cell_idx)       = generateDeviations(1, prof_override.R0.mean, prof_override.R0.std);
                r1_dev(cell_idx)       = generateDeviations(1, prof_override.R1.mean, prof_override.R1.std);
                tau1_dev(cell_idx)     = generateDeviations(1, prof_override.Tau1.mean, prof_override.Tau1.std);
                soc0(cell_idx)         = soc0(cell_idx) + generateDeviations(1, prof_override.SoC.mean, prof_override.SoC.std);
            end
            break; % stop after first matching profile
        end
    end

    % Store deviations in matrices and Modules struct
    capacity_devs(module,:) = capacity_dev';
    r0_devs(module,:)       = r0_dev';
    r1_devs(module,:)       = r1_dev';
    tau1_devs(module,:)     = tau1_dev';
    soc0s(module,:)         = soc0';

    Modules(module).BatteryCapacityCellPercentDeviation = capacity_dev;
    Modules(module).R0ThermalCellPercentDeviation       = r0_dev;
    Modules(module).R1ThermalCellPercentDeviation       = r1_dev;
    Modules(module).Tau1ThermalCellPercentDeviation     = tau1_dev;

    % Other percent deviations as zeros
    Modules(module).SOCBreakpointsCellPercentDeviation = zeros(numCells,1);
    Modules(module).TemperatureBreakpointsCellPercentDeviation = zeros(numCells,1);
    Modules(module).OpenCircuitVoltageThermalCellPercentDeviation = zeros(numCells,1);
    Modules(module).VoltageRangeCellPercentDeviation = zeros(numCells,1);
    Modules(module).ResistanceSOCBreakpointsCellPercentDeviation = zeros(numCells,1);
    Modules(module).ResistanceTemperatureBreakpointsCellPercentDeviation = zeros(numCells,1);
    Modules(module).BatteryThermalMassCellPercentDeviation = zeros(numCells,1);

    % Runtime parameters (column vectors)
    Modules(module).socCell             = soc0;         % 12x1
    Modules(module).numCycles           = repmat(numCycles,numCells,1); % 12x1
    Modules(module).batteryTemperature  = repmat(target_ambient_temp,numCells,1); % 12x1
    Modules(module).batteryVoltage      = zeros(numCells,1);           % 12x1
    Modules(module).batteryCurrent      = zeros(numCells,1);           % 12x1
    Modules(module).vParallelAssembly   = zeros(numParallel,1);        % 6x1
    Modules(module).socParallelAssembly = SYPACK.SocCell0 * ones(numParallel,1);         % 6x1
end


% Assign to base workspace
for i = 1:numModules
    assignin('base', sprintf('Module%02d',i), Modules(i));
end
    
% Save health deviations
file_path = sprintf('./sypack192s2p60ah/SYPACK%d/metadata/pack_health.csv',PACK_ID);
savePackHealthCSV(file_path, ...
                  capacity_devs, r0_devs, r1_devs, tau1_devs, soc0s, SYPACK);


end

