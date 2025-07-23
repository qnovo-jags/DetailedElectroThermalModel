import simscape.battery.builder.*;

cell_param = ev_pack_cell_parameters();

batteryCell = Cell();
batteryCell.Geometry = PouchGeometry();
batteryCell.CellModelOptions.CellModelBlockPath="batt_lib/Cells/Battery Equivalent Circuit";
batteryCell.CellModelOptions.BlockParameters.RCPairs="rc1";


pSet = ParallelAssembly(Cell=batteryCell,NumParallelCells=2,Topology="SingleStack",Rows=1);
module = Module(ParallelAssembly=pSet,NumSeriesAssemblies=6);
moduleAssembly = ModuleAssembly(Module=repmat(module,1,1));

%batteryChart(moduleAssembly)

buildBattery(moduleAssembly,LibraryName="IONIQ_parameters2",Directory="./",...
            MaskInitialTargets="VariableNamesByInstance",...
            MaskParameters="VariableNamesByType")
