import simscape.battery.builder.*;

cell_param = ev_pack_cell_parameters();

batteryCell = Cell();
batteryCell.Geometry = PouchGeometry();

batteryCell.CellModelOptions.CellModelBlockPath="batt_lib/Cells/Battery Equivalent Circuit";
batteryCell.CellModelOptions.BlockParameters.RCPairs="rc1";
batteryCell.CellModelOptions.BlockParameters.ThermalModel = "LumpedThermalMass";

pSet = ParallelAssembly(Cell=batteryCell,NumParallelCells=2,...
    Topology="SingleStack",Rows=1);
module = Module(ParallelAssembly=pSet,NumSeriesAssemblies=6);
moduleAssembly = ModuleAssembly(Module=repmat(module,1,1), ...
    AmbientThermalPath="CellBasedThermalResistance");
%pack = Pack("ModuleAssembly",repmat(moduleAssembly,1,1), ...
%    AmbientThermalPath="CellBasedThermalResistance");
%batteryChart(moduleAssembly)

% buildBattery(moduleAssembly,LibraryName="thermalCoupled",Directory="./",...
%             MaskInitialTargets="VariableNamesByInstance",...
%             MaskParameters="VariableNamesByType")

buildBattery(moduleAssembly,LibraryName="thermalCoupledbyInstance",Directory="./",...
            MaskInitialTargets="VariableNamesByInstance",...
            MaskParameters="VariableNamesByInstance")