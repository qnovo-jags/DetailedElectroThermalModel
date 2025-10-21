
% Extract relevant fields for interpolation
export_struct = struct();
cell_param = ev_pack_cell_parameters();

export_struct.OCV_vs_SOC.T = cell_param.TemperatureBreakpointsCell;
export_struct.OCV_vs_SOC.SOC = cell_param.SOCBreakpointsCell;
export_struct.OCV_vs_SOC.OCV = cell_param.OpenCircuitVoltageThermalCell;

export_struct.R0_vs_SOC.T = cell_param.ResistanceTemperatureBreakpointsCell;
export_struct.R0_vs_SOC.SOC = cell_param.ResistanceSOCBreakpointsCell;
export_struct.R0_vs_SOC.R0 = cell_param.R0ThermalCell;

export_struct.R1_vs_SOC.T = cell_param.ResistanceTemperatureBreakpointsCell;
export_struct.R1_vs_SOC.SOC = cell_param.ResistanceSOCBreakpointsCell;
export_struct.R1_vs_SOC.R1 = cell_param.R1ThermalCell;

export_struct.Tau1_vs_SOC.T = cell_param.ResistanceTemperatureBreakpointsCell;
export_struct.Tau1_vs_SOC.SOC = cell_param.ResistanceSOCBreakpointsCell;
export_struct.Tau1_vs_SOC.Tau1 = cell_param.Tau1ThermalCell;

% Save as JSON
jsonText = jsonencode(export_struct, 'PrettyPrint', true);
fid = fopen('battery_parameters.json', 'w');
fprintf(fid, '%s', jsonText);
fclose(fid);
