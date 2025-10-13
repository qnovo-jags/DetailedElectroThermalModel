% DOE settings for percent deviations 
function [] = setupDOE(DOE_configs, DOE_ID)

numCells = 12;
numModules = 32;
cell_param = ev_pack_cell_parameters();
numCycles = 1;

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

for i = 1:numel(fields)
    assignin("base", fields{i}, DOE_configs(DOE_ID).(fields{i}));
end

%out = getInputsByCase("20250731");
%assign("base", "currentData", out{2})

capacity_devs = zeros(numModules, numCells);
r0_devs       = zeros(numModules, numCells);
r1_devs       = zeros(numModules, numCells);
tau1_devs     = zeros(numModules, numCells);
soc0s    = zeros(numModules, numCells);

for module = 1:numModules
    Modules(module).BatteryCapacityCell = cell_param.BatteryCapacityCell; % Battery capacity, A*hr
    Modules(module).SOCBreakpointsCell = cell_param.SOCBreakpointsCell; % State of charge breakpoints, SOC
    Modules(module).TemperatureBreakpointsCell = cell_param.TemperatureBreakpointsCell; % Temperature breakpoints, T, K
    Modules(module).OpenCircuitVoltageThermalCell = cell_param.OpenCircuitVoltageThermalCell; % Open-circuit voltage, OCV(SOC,T), V
    Modules(module).VoltageRangeCell = cell_param.VoltageRangeCell; % Terminal voltage operating range, [Min Max], V
    Modules(module).ResistanceSOCBreakpointsCell = cell_param.ResistanceSOCBreakpointsCell; % State of charge breakpoints for resistance, SOC
    Modules(module).ResistanceTemperatureBreakpointsCell = cell_param.ResistanceTemperatureBreakpointsCell; % Temperature breakpoints for resistance, T, K
    Modules(module).R0ThermalCell = cell_param.R0ThermalCell; % Instantaneous resistance, R0(SOC,T), Ohm
    Modules(module).R1ThermalCell = cell_param.R1ThermalCell; % First polarization resistance, R1(SOC,T), Ohm
    Modules(module).Tau1ThermalCell = cell_param.Tau1ThermalCell; % First time constant, Tau1(SOC,T), s
    Modules(module).BatteryThermalMassCell = 0.01; % Battery thermal mass, J/K
    Modules(module).AmbientResistance = 0; % Cell level ambient thermal path resistance, K/W

    % Sample percent deviations for each parameter (per cell)
    capacity_dev = generateDeviations(numCells, DOE_configs(DOE_ID).Capacity.mean, DOE_configs(DOE_ID).Capacity.std);
    r0_dev       = generateDeviations(numCells, DOE_configs(DOE_ID).R0.mean, DOE_configs(DOE_ID).R0.std);
    r1_dev       = generateDeviations(numCells, DOE_configs(DOE_ID).R1.mean, DOE_configs(DOE_ID).R1.std);
    tau1_dev     = generateDeviations(numCells, DOE_configs(DOE_ID).Tau1.mean, DOE_configs(DOE_ID).Tau1.std);
    soc0        = generateDeviations(numCells, DOE_configs(DOE_ID).soc0.mean, DOE_configs(DOE_ID).soc0.std);

    capacity_devs(module, :) = capacity_dev';
    r0_devs(module, :)       = r0_dev';
    r1_devs(module, :)       = r1_dev';
    tau1_devs(module, :)     = tau1_dev';
    soc0s(module, :)     = soc0';

    % Store the percent deviations
    Modules(module).BatteryCapacityCellPercentDeviation = capacity_dev;
    Modules(module).R0ThermalCellPercentDeviation = r0_dev;
    Modules(module).R1ThermalCellPercentDeviation = r1_dev;
    Modules(module).Tau1ThermalCellPercentDeviation = tau1_dev;

    Modules(module).SOCBreakpointsCellPercentDeviation = zeros([12, 1]);
    Modules(module).TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]);
    Modules(module).OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]);
    Modules(module).VoltageRangeCellPercentDeviation = zeros([12, 1]);
    Modules(module).ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]);
    Modules(module).ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]);
    Modules(module).BatteryThermalMassCellPercentDeviation = zeros([12, 1]);


    Modules(module).socCell = min(max(soc0, 0), 1); % Cell state of charge
    Modules(module).numCycles = repmat(numCycles, 12, 1); % Discharge cycles
    Modules(module).batteryTemperature = repmat(DOE_configs(DOE_ID).AmbientTemperature, 12, 1); % Temperature, K

    Modules(module).batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
    Modules(module).batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
    Modules(module).vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
    Modules(module).socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

end

for i = 1:numModules
    assignin('base', sprintf('Module%02d', i), Modules(i));
end

Qnom, samplingFrequency, RestTime0, RestTime1, chargeRate, RestTime2, dischargeRate, RestTime3, numChargeCycles

assignin("base", "currentData", multicycleSampler( DOE_configs(DOE_ID).Qnom, ...
                                        DOE_configs(DOE_ID).samplingFreq, ...
                                        DOE_configs(DOE_ID).RestTime0, ...
                                        DOE_configs(DOE_ID).RestTime1, ...
                                        DOE_configs(DOE_ID).chargeRate,...
                                        DOE_configs(DOE_ID).RestTime2, ...
                                        DOE_configs(DOE_ID).dischargeRate, ...
                                        DOE_configs(DOE_ID).RestTime3, ...
                                        DOE_configs(DOE_ID).numChargeCycles));

saveDOECSV(capacity_devs, r0_devs, r1_devs, tau1_devs, soc0s, sprintf('./DOE_Logs/DOE_%d.csv', DOE_ID));

end

function deviations = generateDeviations(numCells, meanVal, stdVal)
    % Generates random percent deviations (e.g., N(mean, std)) for each cell
    rng(0);
    deviations = meanVal + stdVal * randn(numCells, 1);  % Vector of % deviations
end

