%% Battery parameters
cell_param = ev_pack_cell_parameters();
%out = getInputsByCase(dateData);
%% ModuleType1
ModuleType1.BatteryCapacityCell = cell_param.BatteryCapacityCell; % Battery capacity, A*hr
ModuleType1.SOCBreakpointsCell = cell_param.SOCBreakpointsCell; % State of charge breakpoints, SOC
ModuleType1.TemperatureBreakpointsCell = cell_param.TemperatureBreakpointsCell; % Temperature breakpoints, T, K
ModuleType1.OpenCircuitVoltageThermalCell = cell_param.OpenCircuitVoltageThermalCell; % Open-circuit voltage, OCV(SOC,T), V
ModuleType1.VoltageRangeCell = cell_param.VoltageRangeCell; % Terminal voltage operating range, [Min Max], V
ModuleType1.ResistanceSOCBreakpointsCell = cell_param.ResistanceSOCBreakpointsCell; % State of charge breakpoints for resistance, SOC
ModuleType1.ResistanceTemperatureBreakpointsCell = cell_param.ResistanceTemperatureBreakpointsCell; % Temperature breakpoints for resistance, T, K
ModuleType1.R0ThermalCell = cell_param.R0ThermalCell; % Instantaneous resistance, R0(SOC,T), Ohm
ModuleType1.R1ThermalCell = cell_param.R1ThermalCell; % First polarization resistance, R1(SOC,T), Ohm
ModuleType1.Tau1ThermalCell = cell_param.Tau1ThermalCell; % First time constant, Tau1(SOC,T), s
ModuleType1.BatteryThermalMassCell = 0.01; % Battery thermal mass, J/K
ModuleType1.AmbientResistance = 0; % Cell level ambient thermal path resistance, K/W

%% Module1
%Module1.socCell = out{1}; % Cell state of charge
Module1.batteryVoltage = 0; % Terminal voltage, V
Module1.batteryCurrent = 0; % Current (positive in), A
Module1.numCycles = 0; % Discharge cycles
%Module1.batteryTemperature = out{4}; % Temperature, K
Module1.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module1.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

% Suppress MATLAB editor message regarding readability of repmat
%#ok<*REPMAT>
