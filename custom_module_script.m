import simscape.battery.builder.*;
batteryCell = Cell(Geometry=PouchGeometry);
pSet = ParallelAssembly(Cell=batteryCell,NumParallelCells=2,Topology="SingleStack",Rows=1);
module = Module(ParallelAssembly=pSet,NumSeriesAssemblies=6);

batteryChart(module)

buildBattery(module,LibraryName="myBatteries",Directory="./")
