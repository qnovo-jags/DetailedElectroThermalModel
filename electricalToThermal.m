function electricalToThermal(modelName)

add_block('simulink/Signal Routing/Mux', [modelName '/Mux_i'], ...
    'Inputs', '32', 'Position', [-400 80 -390 100]);  % number of inputs
add_block('simulink/Signal Routing/Mux', [modelName '/Mux_v'], ...
    'Inputs', '32', 'Position', [-300 80 -290 100])
add_block('simulink/Signal Routing/Mux', [modelName '/Mux_u'], ...
    'Inputs', '32','Position', [-200 80 -190 100])

for i = 1:32
    % ----- Names and paths -----
    suffix = sprintf('%d', i);
    yBase = 50 + 120 * (i - 1);
    
    probeName = ['MyProbeBlock' suffix];
    probePath = [modelName '/' probeName];

    % Connect probe outputs to function inputs (order: ocv, iCell, vCell)
    % new order : i, v,ocv 
    add_line(modelName, sprintf('%s/3', probeName), sprintf('Mux_u/%d', i), 'autorouting', 'on'); % ocv → input 3
    add_line(modelName, sprintf('%s/1', probeName), sprintf('Mux_i/%d', i), 'autorouting', 'on'); % iCell → input 1
    add_line(modelName, sprintf('%s/2', probeName), sprintf('Mux_v/%d', i), 'autorouting', 'on'); % vCell → input 2

    % blockS2P = sprintf('SimulinkToPS%d', i);       % New block name you want
    % blockPathS2P = sprintf('%s/%s', modelName, blockS2P);
    % add_block('nesl_utility/Simulink-PS Converter', blockPathS2P);
    % 
    % add_line(modelName, sprintf('%s/1', blockName), sprintf('%s/1',blockS2P), 'autorouting', 'on');
    % add_line(modelName, sprintf('%s/RConn 1',blockS2P), sprintf('heat%d/RConn 1', i), 'autorouting', 'on')
end

add_block('heatGenMux/MyFunction', sprintf("%s/muxHeatCompute", modelName), ...
    "Position", [-100 80 -50 100]);

add_line(modelName, "Mux_i/1", "muxHeatCompute/1")
add_line(modelName, "Mux_v/1", "muxHeatCompute/2")
add_line(modelName, "Mux_u/1", "muxHeatCompute/3")

add_block('simulink/Signal Routing/Demux', [modelName '/Demux'], ...
    'Outputs', '32', 'Position', [0 80 10 100]); 


add_line(modelName, "muxHeatCompute/1", "Demux/1")
for i = 1:32
    converterName = sprintf('SPC%d', i);  % Simulink-PS Converter block name
    converterPath = sprintf('%s/%s', modelName, converterName);
    
    % Position (you can adjust for layout)
    x = 400; y = (i-1)*5;
    pos = [x, y, x+20, y+5];
    
    % Add Simulink-PS Converter block
    add_block('nesl_utility/Simulink-PS Converter', ...
              converterPath, ...
              'Position', pos);
    
    % Connect Demux output to Converter
    add_line(modelName, ...
             sprintf('Demux/%d', i), ...
             sprintf('%s/1', converterName), ...
             'autorouting', 'on');
    
    % Connect Converter to Simscape component (assumes port name is 'RConn 1')
    add_line(modelName, ...
             sprintf('%s/RConn1', converterName), ...
             sprintf('heat%d/RConn 1', i), ...
             'autorouting', 'on');
end


end