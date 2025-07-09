% Load your library
load_system('myBatteries_lib');

% Create a new model
new_system('electricalModel');
open_system('electricalModel');

blockSpacing = 120;                % Horizontal spacing between blocks
x0 = 50; y0 = 100;                 % Starting position

% Add your custom block from the library
for i = 1:1:32
    filename = strcat('electricalModel/Module', num2str(i));
    add_block('myBatteries_lib/Module1', filename, ...
         'Position', getBlockPosition(i));
end

for i = 2:1:32
    srcPort = sprintf('Module%d/RConn1', i-1); % Output of previous block
    dstPort = sprintf('Module%d/LConn1', i);   % Input of current block
    add_line(electricalModel, srcPort, dstPort, 'autorouting', 'on');
end

add_block('simulink/Signal Routing/Connection Port', 'electricalModel/plus');
add_block('simulink/Signal Routing/Connection Port', 'electricalModel/minus');

for i=1:1:32
    probePath = ['electricalModel', sprintf('/MyProbeBlock%d',i)];
    targetBlock = ['electricalModel', sprintf('/Module%d',i)];
    add_block('nesl_utility/Probe',probePath, "Position",getBlockPosition(i)+[0, 600,0, 600]);
    simscape.probe.setBoundBlock(probePath, targetBlock);
    simscape.probe.setVariables(probePath, ["Cell1.ocv","socCell"]);
end

% Save the model
save_system('electricalModel');
