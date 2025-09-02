caller = dbstack;
if length(caller) <= 1
    % Script is being run independently
    isStandalone = true;
else
    % Script is being called from another script/function
    isStandalone = false;
end

if isStandalone
    modelName = 'electricalModel';
    new_system(modelName);
    open_system(modelName);
end

%IONIQ_parameters2_param
load_system('./BatteryGeneration/thermalCoupled_lib');
load_system('./BatteryGeneration/thermalCoupled')
% Add your custom block from the library
for i = 1:1:32
    filename = sprintf('%s/Module%d', modelName, i);
    add_block('thermalCoupled/ModuleAssembly1/Module1', filename, ...
        'Position', getBlockPosition(i));
    %add_block('IONIQ_parameters2_lib/Modules/ModuleType1', filename, ...
    %     'Position', getBlockPosition(i));
end

for i = 2:1:32
    srcPort = sprintf('Module%d/RConn1', i-1); % Output of previous block
    dstPort = sprintf('Module%d/LConn2', i);   % Input of current block
    add_line(modelName, srcPort, dstPort, 'autorouting', 'on');
end

for i=1:1:32
    probePath = [modelName, sprintf('/MyProbeBlock%d',i)];
    targetBlock = [modelName, sprintf('/Module%d',i)];
    add_block('nesl_utility/Probe',probePath, "Position",getBlockPosition(i)+[-1000, 0,-1000, 0]);
    simscape.probe.setBoundBlock(probePath, targetBlock);
    simscape.probe.setVariables(probePath, ["Cell1.batteryCurrent","Cell1.batteryVoltage","Cell1.ocv"]);
end

solverBlock = [modelName, '/SolverConfig'];
add_block('nesl_utility/Solver Configuration', solverBlock,...
    "Position", [200, 160, 230, 180]);

cyclerBlock = [modelName, '/Cycler'];
add_block('batt_lib/Cyclers/Cycler', cyclerBlock, "Position", [245,  -120,   295,   -70]);

% constantCurrent = [modelName, '/ConstantCurrent'];
% add_block('fl_lib/Physical Signals/Sources/PS Constant', constantCurrent)
% set_param(constantCurrent, 'constant', 'currentDraw')

currentProfile = [modelName, '/currentProfile'];
add_block('simulink/Sources/From Workspace', currentProfile, ...
    "Position", [95,  -120,   145,   -90]);
set_param(currentProfile, "VariableName", 'currentData') 
set_param(currentProfile, "SampleTime", '10') 
set_param(currentProfile, 'ShowName', 'off');
currentProfiletoSimscape = [modelName, '/currentProfiletoSimscape'];
add_block('nesl_utility/Simulink-PS Converter', currentProfiletoSimscape,...
    "Position", [ 175,  -120,   195,   -90]);
set_param(currentProfiletoSimscape, 'ShowName', 'off');
add_line(modelName, 'currentProfile/1', 'currentProfiletoSimscape/1', 'autorouting', 'on');


constant1 = [modelName, '/Constant1'];
add_block('fl_lib/Physical Signals/Sources/PS Constant',constant1, ...
    "Position", [145,   -90,   165,   -70])

add_line(modelName, 'Constant1/RConn 1', 'Cycler/LConn 3')
%add_line(modelName, 'ConstantCurrent/RConn 1', 'Cycler/LConn 1')
add_line(modelName, 'currentProfiletoSimscape/RConn 1',  'Cycler/LConn 1')

add_line(modelName, 'Cycler/RConn 1', 'Module1/LConn 2', 'autorouting', 'on')
add_line(modelName, 'Cycler/RConn 2', 'Module32/RConn 1', 'autorouting', 'on')

add_block('fl_lib/Electrical/Electrical Elements/Electrical Reference', ...
    [modelName '/ElectricalRef'], ...
    'Position', [680, 800, 700,820]);

add_line(modelName, 'ElectricalRef/LConn 1', 'Module32/RConn 1', 'autorouting', 'on')
add_line(modelName, 'SolverConfig/RConn 1', 'Cycler/RConn 2', 'autorouting', 'smart')

probePath = [modelName, '/PackProbe'];
targetBlock = [modelName, '/Cycler'];
add_block('nesl_utility/Probe',probePath, "Position", [ 395,  -163,   455,  -112]);
simscape.probe.setBoundBlock(probePath, targetBlock);
simscape.probe.setVariables(probePath, ["i","v"]);