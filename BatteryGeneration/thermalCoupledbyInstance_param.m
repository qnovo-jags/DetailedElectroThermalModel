%% Battery parameters

%% Module1
Module1.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module1.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module1.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module1.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module1.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module1.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module1.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module1.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module1.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module1.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module1.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module1.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Battery initial targets

%% Module1
Module1.socCell = 1; % Cell state of charge
Module1.batteryVoltage = 0; % Terminal voltage, V
Module1.batteryCurrent = 0; % Current (positive in), A
Module1.numCycles = 0; % Discharge cycles
Module1.batteryTemperature = 298.15; % Temperature, K
Module1.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module1.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

% Suppress MATLAB editor message regarding readability of repmat
%#ok<*REPMAT>
