function add_temp_to_workspace(modelName)
% add_temp_to_workspace_with_goto
% Connects 32 TempProbeBlock outputs to To Workspace blocks inside a subsystem
% using Goto/From blocks to preserve physical connections.
%
% Usage:
%   add_temp_to_workspace_with_goto('MyModel')

    % Load system
    if ~bdIsLoaded(modelName)
        load_system(modelName);
    end

    % Subsystem path
    subsysName = [modelName, '/AllTempToWorkspace'];
    
    % Create subsystem if missing
    if isempty(find_system(modelName, 'SearchDepth',1,'Name','AllTempToWorkspace'))
        add_block('simulink/Ports & Subsystems/Subsystem', subsysName, ...
            'Position', [-545  -255  -345   -55]);
        set_param(subsysName,'BackgroundColor','[1 1 0.8]');
        fprintf('🧩 Created subsystem: %s\n', subsysName);
    end

    % Layout parameters inside subsystem
    xStart = 50;
    yStart = 50;
    xGap = 200;
    yGap = 50;
    nCols = 4;

    for k = 1:32
        % --- Names ---
        tempProbeBlk = sprintf('%s/TempProbeBlock%d', modelName, k);
        gotoTag = sprintf('Temp%d', k);
        gotoBlk = sprintf('%s/Goto_Temp%d', modelName, k);
        fromBlk = sprintf('%s/From_Temp%d', subsysName, k);
        wsBlkName = sprintf('%s/Temp_Module%d_Out', subsysName, k);

        % --- Add Goto block at top-level to link TempProbeBlock ---
        if isempty(find_system(modelName,'SearchDepth',1,'Name',sprintf('Goto_Temp%d',k)))
            add_block('simulink/Signal Routing/Goto', gotoBlk, 'GotoTag', gotoTag);
            pos = get_param(tempProbeBlk,'Position');
            add_line(modelName, sprintf('TempProbeBlock%d/1', k), sprintf('Goto_Temp%d/1', k), 'autorouting','on');
            set_param(gotoBlk,'Position',[pos(3)+30 pos(2) pos(3)+70 pos(2)+30]);
        end

        % --- Add From block inside subsystem ---
        if isempty(find_system(subsysName,'SearchDepth',1,'Name',sprintf('From_Temp%d',k)))
            add_block('simulink/Signal Routing/From', fromBlk, 'GotoTag', gotoTag);
            col = mod(k-1,nCols);
            row = floor((k-1)/nCols);
            xPos = xStart + col*xGap;
            yPos = yStart + row*yGap;
            set_param(fromBlk,'Position',[xPos yPos xPos+30 yPos+30]);
        end

        % --- Add To Workspace block inside subsystem ---
        if isempty(find_system(subsysName,'SearchDepth',1,'Name',sprintf('Temp_Module%d_Out',k)))
            add_block('simulink/Sinks/To Workspace', wsBlkName, 'MakeNameUnique','on');
            set_param(wsBlkName, ...
                'VariableName', sprintf('Temp_Module%d', k), ...
                'SaveFormat','StructureWithTime');
            set_param(wsBlkName,'Position',[xPos+100 yPos xPos+180 yPos+30]);
        end

        % --- Connect From -> To Workspace ---
        try
            add_line(subsysName, sprintf('From_Temp%d/1',k), sprintf('Temp_Module%d_Out/1',k), 'autorouting','on');
        catch
            % ignore if line exists
        end
    end

    % Arrange subsystem nicely
    Simulink.BlockDiagram.arrangeSystem(subsysName);
    fprintf('✅ All 32 TempProbeBlocks connected to To Workspace via subsystem "%s".\n', subsysName);
end
