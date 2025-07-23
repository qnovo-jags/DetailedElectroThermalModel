function electricalToThermal(modelName)

for i = 1:32
    % ----- Names and paths -----
    suffix = sprintf('%d', i);
    yBase = 50 + 120 * (i - 1);
    
    probeName = ['MyProbeBlock' suffix];
    probePath = [modelName '/' probeName];

    % ----- Add MATLAB Function Block -----
    blockName = sprintf('heatGen_%d', i);
    blockPath = [modelName, '/', blockName];
    add_block('algebraicManip_lib/threeMinusOneIntoTwo', blockPath, 'Position', [0 100 50 150]);

    % Connect probe outputs to function inputs (order: ocv, iCell, vCell)
    % new order : i, v,ocv 
    add_line(modelName, sprintf('%s/3', probeName), sprintf('%s/1', blockName), 'autorouting', 'on'); % ocv → input 3
    add_line(modelName, sprintf('%s/1', probeName), sprintf('%s/2', blockName), 'autorouting', 'on'); % iCell → input 1
    add_line(modelName, sprintf('%s/2', probeName), sprintf('%s/3', blockName), 'autorouting', 'on'); % vCell → input 2

    blockS2P = sprintf('SimulinkToPS%d', i);       % New block name you want
    blockPathS2P = sprintf('%s/%s', modelName, blockS2P);
    add_block('nesl_utility/Simulink-PS Converter', blockPathS2P);

    add_line(modelName, sprintf('%s/1', blockName), sprintf('%s/1',blockS2P), 'autorouting', 'on');
    add_line(modelName, sprintf('%s/RConn 1',blockS2P), sprintf('heat%d/RConn 1', i), 'autorouting', 'on')
end

end