%% Battery parameters

%% Module01
Module01.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module01.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module01.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module01.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module01.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module01.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module01.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module01.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module01.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module01.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module01.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module01.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module01.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module01.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module01.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module01.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module01.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module01.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module01.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module01.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module01.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module01.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module01.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module02
Module02.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module02.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module02.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module02.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module02.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module02.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module02.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module02.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module02.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module02.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module02.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module02.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module02.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module02.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module02.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module02.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module02.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module02.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module02.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module02.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module02.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module02.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module02.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module03
Module03.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module03.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module03.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module03.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module03.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module03.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module03.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module03.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module03.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module03.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module03.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module03.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module03.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module03.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module03.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module03.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module03.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module03.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module03.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module03.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module03.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module03.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module03.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module04
Module04.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module04.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module04.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module04.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module04.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module04.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module04.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module04.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module04.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module04.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module04.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module04.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module04.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module04.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module04.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module04.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module04.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module04.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module04.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module04.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module04.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module04.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module04.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module05
Module05.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module05.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module05.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module05.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module05.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module05.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module05.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module05.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module05.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module05.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module05.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module05.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module05.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module05.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module05.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module05.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module05.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module05.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module05.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module05.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module05.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module05.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module05.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module06
Module06.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module06.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module06.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module06.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module06.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module06.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module06.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module06.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module06.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module06.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module06.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module06.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module06.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module06.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module06.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module06.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module06.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module06.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module06.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module06.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module06.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module06.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module06.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module07
Module07.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module07.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module07.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module07.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module07.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module07.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module07.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module07.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module07.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module07.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module07.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module07.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module07.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module07.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module07.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module07.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module07.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module07.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module07.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module07.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module07.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module07.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module07.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module08
Module08.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module08.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module08.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module08.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module08.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module08.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module08.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module08.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module08.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module08.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module08.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module08.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module08.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module08.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module08.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module08.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module08.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module08.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module08.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module08.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module08.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module08.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module08.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module09
Module09.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module09.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module09.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module09.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module09.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module09.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module09.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module09.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module09.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module09.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module09.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module09.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module09.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module09.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module09.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module09.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module09.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module09.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module09.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module09.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module09.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module09.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module09.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module10
Module10.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module10.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module10.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module10.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module10.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module10.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module10.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module10.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module10.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module10.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module10.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module10.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module10.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module10.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module10.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module10.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module10.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module10.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module10.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module10.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module10.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module10.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module10.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module11
Module11.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module11.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module11.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module11.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module11.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module11.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module11.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module11.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module11.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module11.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module11.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module11.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module11.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module11.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module11.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module11.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module11.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module11.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module11.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module11.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module11.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module11.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module11.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module12
Module12.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module12.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module12.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module12.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module12.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module12.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module12.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module12.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module12.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module12.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module12.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module12.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module12.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module12.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module12.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module12.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module12.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module12.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module12.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module12.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module12.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module12.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module12.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module13
Module13.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module13.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module13.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module13.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module13.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module13.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module13.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module13.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module13.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module13.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module13.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module13.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module13.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module13.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module13.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module13.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module13.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module13.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module13.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module13.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module13.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module13.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module13.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module14
Module14.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module14.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module14.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module14.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module14.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module14.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module14.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module14.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module14.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module14.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module14.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module14.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module14.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module14.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module14.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module14.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module14.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module14.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module14.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module14.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module14.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module14.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module14.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module15
Module15.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module15.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module15.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module15.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module15.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module15.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module15.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module15.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module15.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module15.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module15.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module15.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module15.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module15.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module15.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module15.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module15.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module15.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module15.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module15.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module15.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module15.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module15.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module16
Module16.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module16.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module16.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module16.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module16.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module16.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module16.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module16.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module16.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module16.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module16.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module16.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module16.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module16.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module16.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module16.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module16.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module16.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module16.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module16.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module16.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module16.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module16.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module17
Module17.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module17.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module17.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module17.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module17.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module17.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module17.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module17.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module17.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module17.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module17.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module17.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module17.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module17.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module17.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module17.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module17.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module17.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module17.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module17.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module17.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module17.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module17.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module18
Module18.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module18.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module18.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module18.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module18.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module18.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module18.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module18.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module18.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module18.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module18.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module18.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module18.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module18.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module18.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module18.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module18.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module18.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module18.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module18.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module18.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module18.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module18.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module19
Module19.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module19.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module19.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module19.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module19.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module19.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module19.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module19.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module19.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module19.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module19.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module19.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module19.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module19.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module19.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module19.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module19.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module19.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module19.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module19.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module19.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module19.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module19.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module20
Module20.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module20.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module20.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module20.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module20.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module20.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module20.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module20.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module20.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module20.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module20.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module20.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module20.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module20.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module20.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module20.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module20.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module20.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module20.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module20.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module20.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module20.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module20.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module21
Module21.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module21.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module21.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module21.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module21.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module21.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module21.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module21.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module21.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module21.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module21.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module21.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module21.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module21.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module21.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module21.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module21.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module21.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module21.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module21.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module21.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module21.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module21.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module22
Module22.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module22.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module22.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module22.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module22.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module22.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module22.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module22.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module22.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module22.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module22.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module22.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module22.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module22.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module22.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module22.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module22.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module22.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module22.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module22.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module22.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module22.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module22.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module23
Module23.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module23.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module23.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module23.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module23.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module23.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module23.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module23.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module23.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module23.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module23.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module23.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module23.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module23.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module23.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module23.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module23.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module23.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module23.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module23.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module23.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module23.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module23.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module24
Module24.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module24.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module24.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module24.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module24.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module24.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module24.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module24.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module24.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module24.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module24.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module24.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module24.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module24.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module24.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module24.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module24.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module24.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module24.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module24.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module24.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module24.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module24.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module25
Module25.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module25.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module25.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module25.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module25.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module25.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module25.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module25.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module25.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module25.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module25.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module25.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module25.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module25.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module25.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module25.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module25.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module25.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module25.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module25.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module25.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module25.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module25.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module26
Module26.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module26.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module26.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module26.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module26.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module26.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module26.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module26.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module26.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module26.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module26.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module26.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module26.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module26.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module26.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module26.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module26.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module26.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module26.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module26.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module26.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module26.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module26.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module27
Module27.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module27.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module27.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module27.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module27.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module27.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module27.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module27.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module27.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module27.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module27.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module27.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module27.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module27.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module27.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module27.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module27.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module27.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module27.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module27.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module27.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module27.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module27.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module28
Module28.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module28.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module28.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module28.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module28.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module28.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module28.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module28.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module28.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module28.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module28.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module28.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module28.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module28.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module28.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module28.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module28.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module28.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module28.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module28.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module28.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module28.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module28.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module29
Module29.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module29.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module29.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module29.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module29.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module29.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module29.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module29.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module29.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module29.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module29.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module29.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module29.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module29.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module29.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module29.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module29.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module29.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module29.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module29.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module29.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module29.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module29.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module30
Module30.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module30.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module30.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module30.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module30.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module30.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module30.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module30.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module30.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module30.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module30.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module30.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module30.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module30.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module30.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module30.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module30.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module30.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module30.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module30.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module30.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module30.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module30.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module31
Module31.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module31.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module31.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module31.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module31.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module31.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module31.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module31.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module31.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module31.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module31.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module31.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module31.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module31.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module31.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module31.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module31.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module31.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module31.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module31.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module31.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module31.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module31.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Module32
Module32.BatteryCapacityCell = 27; % Battery capacity, A*hr
Module32.BatteryCapacityCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryCapacityCell
Module32.SOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints, SOC
Module32.SOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for SOCBreakpointsCell
Module32.TemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints, T, K
Module32.TemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for TemperatureBreakpointsCell
Module32.OpenCircuitVoltageThermalCell = [3.49, 3.5, 3.51; 3.55, 3.57, 3.56; 3.62, 3.63, 3.64; 3.71, 3.71, 3.72; 3.91, 3.93, 3.94; 4.07, 4.08, 4.08; 4.19, 4.19, 4.19]; % Open-circuit voltage, OCV(SOC,T), V
Module32.OpenCircuitVoltageThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for OpenCircuitVoltageThermalCell
Module32.VoltageRangeCell = [0, inf]; % Terminal voltage operating range, [Min Max], V
Module32.VoltageRangeCellPercentDeviation = zeros([12, 1]); % Percent deviation for VoltageRangeCell
Module32.ResistanceSOCBreakpointsCell = [0, .1, .25, .5, .75, .9, 1]; % State of charge breakpoints for resistance, SOC
Module32.ResistanceSOCBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceSOCBreakpointsCell
Module32.ResistanceTemperatureBreakpointsCell = [278, 293, 313]; % Temperature breakpoints for resistance, T, K
Module32.ResistanceTemperatureBreakpointsCellPercentDeviation = zeros([12, 1]); % Percent deviation for ResistanceTemperatureBreakpointsCell
Module32.R0ThermalCell = [.0117, .0085, .009; .011, .0085, .009; .0114, .0087, .0092; .0107, .0082, .0088; .0107, .0083, .0091; .0113, .0085, .0089; .0116, .0085, .0089]; % Instantaneous resistance, R0(SOC,T), Ohm
Module32.R0ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R0ThermalCell
Module32.R1ThermalCell = [.0109, .0029, .0013; .0069, .0024, .0012; .0047, .0026, .0013; .0034, .0016, .001; .0033, .0023, .0014; .0033, .0018, .0011; .0028, .0017, .0011]; % First polarization resistance, R1(SOC,T), Ohm
Module32.R1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for R1ThermalCell
Module32.Tau1ThermalCell = [20, 36, 39; 31, 45, 39; 109, 105, 61; 36, 29, 26; 59, 77, 67; 40, 33, 29; 25, 39, 33]; % First time constant, Tau1(SOC,T), s
Module32.Tau1ThermalCellPercentDeviation = zeros([12, 1]); % Percent deviation for Tau1ThermalCell
Module32.BatteryThermalMassCell = 100; % Battery thermal mass, J/K
Module32.BatteryThermalMassCellPercentDeviation = zeros([12, 1]); % Percent deviation for BatteryThermalMassCell
Module32.AmbientResistance = 25; % Cell level ambient thermal path resistance, K/W

%% Battery initial targets

%% Module01
Module01.socCell = repmat(1, 12, 1); % Cell state of charge
Module01.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module01.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module01.numCycles = repmat(0, 12, 1); % Discharge cycles
Module01.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module01.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module01.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module02
Module02.socCell = repmat(1, 12, 1); % Cell state of charge
Module02.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module02.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module02.numCycles = repmat(0, 12, 1); % Discharge cycles
Module02.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module02.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module02.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module03
Module03.socCell = repmat(1, 12, 1); % Cell state of charge
Module03.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module03.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module03.numCycles = repmat(0, 12, 1); % Discharge cycles
Module03.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module03.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module03.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module04
Module04.socCell = repmat(1, 12, 1); % Cell state of charge
Module04.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module04.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module04.numCycles = repmat(0, 12, 1); % Discharge cycles
Module04.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module04.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module04.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module05
Module05.socCell = repmat(1, 12, 1); % Cell state of charge
Module05.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module05.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module05.numCycles = repmat(0, 12, 1); % Discharge cycles
Module05.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module05.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module05.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module06
Module06.socCell = repmat(1, 12, 1); % Cell state of charge
Module06.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module06.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module06.numCycles = repmat(0, 12, 1); % Discharge cycles
Module06.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module06.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module06.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module07
Module07.socCell = repmat(1, 12, 1); % Cell state of charge
Module07.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module07.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module07.numCycles = repmat(0, 12, 1); % Discharge cycles
Module07.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module07.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module07.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module08
Module08.socCell = repmat(1, 12, 1); % Cell state of charge
Module08.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module08.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module08.numCycles = repmat(0, 12, 1); % Discharge cycles
Module08.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module08.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module08.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module09
Module09.socCell = repmat(1, 12, 1); % Cell state of charge
Module09.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module09.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module09.numCycles = repmat(0, 12, 1); % Discharge cycles
Module09.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module09.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module09.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module10
Module10.socCell = repmat(1, 12, 1); % Cell state of charge
Module10.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module10.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module10.numCycles = repmat(0, 12, 1); % Discharge cycles
Module10.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module10.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module10.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module11
Module11.socCell = repmat(1, 12, 1); % Cell state of charge
Module11.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module11.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module11.numCycles = repmat(0, 12, 1); % Discharge cycles
Module11.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module11.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module11.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module12
Module12.socCell = repmat(1, 12, 1); % Cell state of charge
Module12.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module12.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module12.numCycles = repmat(0, 12, 1); % Discharge cycles
Module12.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module12.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module12.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module13
Module13.socCell = repmat(1, 12, 1); % Cell state of charge
Module13.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module13.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module13.numCycles = repmat(0, 12, 1); % Discharge cycles
Module13.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module13.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module13.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module14
Module14.socCell = repmat(1, 12, 1); % Cell state of charge
Module14.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module14.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module14.numCycles = repmat(0, 12, 1); % Discharge cycles
Module14.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module14.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module14.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module15
Module15.socCell = repmat(1, 12, 1); % Cell state of charge
Module15.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module15.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module15.numCycles = repmat(0, 12, 1); % Discharge cycles
Module15.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module15.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module15.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module16
Module16.socCell = repmat(1, 12, 1); % Cell state of charge
Module16.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module16.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module16.numCycles = repmat(0, 12, 1); % Discharge cycles
Module16.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module16.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module16.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module17
Module17.socCell = repmat(1, 12, 1); % Cell state of charge
Module17.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module17.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module17.numCycles = repmat(0, 12, 1); % Discharge cycles
Module17.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module17.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module17.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module18
Module18.socCell = repmat(1, 12, 1); % Cell state of charge
Module18.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module18.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module18.numCycles = repmat(0, 12, 1); % Discharge cycles
Module18.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module18.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module18.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module19
Module19.socCell = repmat(1, 12, 1); % Cell state of charge
Module19.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module19.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module19.numCycles = repmat(0, 12, 1); % Discharge cycles
Module19.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module19.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module19.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module20
Module20.socCell = repmat(1, 12, 1); % Cell state of charge
Module20.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module20.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module20.numCycles = repmat(0, 12, 1); % Discharge cycles
Module20.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module20.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module20.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module21
Module21.socCell = repmat(1, 12, 1); % Cell state of charge
Module21.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module21.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module21.numCycles = repmat(0, 12, 1); % Discharge cycles
Module21.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module21.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module21.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module22
Module22.socCell = repmat(1, 12, 1); % Cell state of charge
Module22.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module22.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module22.numCycles = repmat(0, 12, 1); % Discharge cycles
Module22.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module22.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module22.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module23
Module23.socCell = repmat(1, 12, 1); % Cell state of charge
Module23.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module23.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module23.numCycles = repmat(0, 12, 1); % Discharge cycles
Module23.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module23.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module23.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module24
Module24.socCell = repmat(1, 12, 1); % Cell state of charge
Module24.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module24.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module24.numCycles = repmat(0, 12, 1); % Discharge cycles
Module24.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module24.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module24.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module25
Module25.socCell = repmat(1, 12, 1); % Cell state of charge
Module25.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module25.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module25.numCycles = repmat(0, 12, 1); % Discharge cycles
Module25.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module25.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module25.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module26
Module26.socCell = repmat(1, 12, 1); % Cell state of charge
Module26.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module26.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module26.numCycles = repmat(0, 12, 1); % Discharge cycles
Module26.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module26.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module26.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module27
Module27.socCell = repmat(1, 12, 1); % Cell state of charge
Module27.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module27.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module27.numCycles = repmat(0, 12, 1); % Discharge cycles
Module27.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module27.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module27.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module28
Module28.socCell = repmat(1, 12, 1); % Cell state of charge
Module28.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module28.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module28.numCycles = repmat(0, 12, 1); % Discharge cycles
Module28.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module28.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module28.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module29
Module29.socCell = repmat(1, 12, 1); % Cell state of charge
Module29.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module29.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module29.numCycles = repmat(0, 12, 1); % Discharge cycles
Module29.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module29.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module29.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module30
Module30.socCell = repmat(1, 12, 1); % Cell state of charge
Module30.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module30.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module30.numCycles = repmat(0, 12, 1); % Discharge cycles
Module30.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module30.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module30.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module31
Module31.socCell = repmat(1, 12, 1); % Cell state of charge
Module31.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module31.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module31.numCycles = repmat(0, 12, 1); % Discharge cycles
Module31.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module31.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module31.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

%% Module32
Module32.socCell = repmat(1, 12, 1); % Cell state of charge
Module32.batteryVoltage = repmat(0, 12, 1); % Terminal voltage, V
Module32.batteryCurrent = repmat(0, 12, 1); % Current (positive in), A
Module32.numCycles = repmat(0, 12, 1); % Discharge cycles
Module32.batteryTemperature = repmat(298.15, 12, 1); % Temperature, K
Module32.vParallelAssembly = repmat(0, 6, 1); % Parallel Assembly Voltage, V
Module32.socParallelAssembly = repmat(1, 6, 1); % Parallel Assembly state of charge

% Suppress MATLAB editor message regarding readability of repmat
%#ok<*REPMAT>
