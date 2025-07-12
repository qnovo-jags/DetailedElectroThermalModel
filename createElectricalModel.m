% Load your library
load_system('myBatteries_lib');

% Create a new model
%modelName = 'electricalModel';
%new_system(modelName);
%open_system(modelName);

% Add your custom block from the library
for i = 1:1:32
    filename = sprintf('%s/Module%d', modelName, i);
    add_block('myBatteries_lib/Module1', filename, ...
         'Position', getBlockPosition(i));
end

for i = 2:1:32
    srcPort = sprintf('Module%d/RConn1', i-1); % Output of previous block
    dstPort = sprintf('Module%d/LConn1', i);   % Input of current block
    add_line(modelName, srcPort, dstPort, 'autorouting', 'on');
end

for i=1:1:32
    probePath = [modelName, sprintf('/MyProbeBlock%d',i)];
    targetBlock = [modelName, sprintf('/Module%d',i)];
    add_block('nesl_utility/Probe',probePath, "Position",getBlockPosition(i)+[-1000, 0,-1000, 0]);
    simscape.probe.setBoundBlock(probePath, targetBlock);
    simscape.probe.setVariables(probePath, ["Cell1.ocv","iCell", "vCell"]);
end

% Save the model
%save_system(modelName);
