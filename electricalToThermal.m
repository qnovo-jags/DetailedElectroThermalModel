function electricalToThermal(modelName)

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
             sprintf('heatGenModule%d/1', i), ...
             sprintf('%s/1', converterName), ...
             'autorouting', 'on');
    
    % Connect Converter to Simscape component (assumes port name is 'RConn 1')
    add_line(modelName, ...
             sprintf('%s/RConn1', converterName), ...
             sprintf('heat%d/RConn 1', i), ...
             'autorouting', 'on');
end


end