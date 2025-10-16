function add_probes_subsystem_grid(modelName, numModule)
% add_probes_subsystem_grid
% Adds 32 module probes into a single Subsystem, arranging them in a grid
% for a clean layout. Each probe has To Workspace blocks connected.
%
% Inputs:
%   modelName - string, top-level Simulink model name

    % Load system
    if ~bdIsLoaded(modelName)
        load_system(modelName);
    end

    % Subsystem path
    subsysName = [modelName, '/AllProbesSubsystem'];

    % Create subsystem if missing
    if isempty(find_system(modelName, 'SearchDepth', 1, 'Name', 'AllProbesSubsystem'))
        add_block('simulink/Ports & Subsystems/Subsystem', subsysName, ...
            'Position', [-295  -255   -95   -55]);
            % 'Position', [100 100 800 600]);
        
        set_param(subsysName, 'BackgroundColor', '[0.5 0.5 0.8]');
        fprintf('🧩 Created subsystem: %s\n', subsysName);
    else
        fprintf('ℹ️ Using existing subsystem: %s\n', subsysName);
    end
    load_system(subsysName);

    % Probe signals
    probeSignals = { 'AmbH.T','batteryCurrent', 'batteryTemperature', ...
        'batteryVoltage', 'n.v', 'numCycles', 'p.v', 'socCell', ...
        'socParallelAssembly', 'vParallelAssembly'};
    nSignals = numel(probeSignals);

    % Layout parameters
    xProbeStart = 50;       % left margin for probes
    yProbeStart = 50;       % top margin for probes
    xProbeGap = 400;        % horizontal spacing between probes
    yProbeGap = 250;        % vertical spacing between probes
    nCols = 4;              % number of columns for grid layout
    xWSOffset = 150;        % horizontal offset for To Workspace blocks
    ySignalGap = 20;        % vertical gap between signals inside probe

    for k = 1:numModule
        modulePath = sprintf('%s/Module%d', modelName, k);
        [~, moduleBaseName] = fileparts(modulePath);
        probeBlkName = ['Probe_' moduleBaseName];
        probeFullPath = [subsysName, '/', probeBlkName];

        % Add probe if missing
        if isempty(find_system(subsysName, 'SearchDepth', 1, 'Name', probeBlkName))
            add_block('nesl_utility/Probe', probeFullPath, 'MakeNameUnique', 'on');
        end

        % Bind probe and assign variables
        simscape.probe.setBoundBlock(probeFullPath, modulePath);
        simscape.probe.setVariables(probeFullPath, probeSignals);

        % Grid position
        col = mod(k-1, nCols);
        row = floor((k-1)/nCols);
        probeX = xProbeStart + col*xProbeGap;
        probeY = yProbeStart + row*yProbeGap;

        set_param(probeFullPath, 'Position', [probeX, probeY, probeX+60, probeY + max(30, nSignals*ySignalGap)]);

        % Add and connect To Workspace blocks
        for i = 1:nSignals
            varName = matlab.lang.makeValidName(probeSignals{i});
            wsBlkName = sprintf('%s_%s_Out', varName, moduleBaseName);
            wsFullPath = [subsysName, '/', wsBlkName];

            if isempty(find_system(subsysName, 'SearchDepth', 1, 'Name', wsBlkName))
                add_block('simulink/Sinks/To Workspace', wsFullPath, 'MakeNameUnique', 'on');
                set_param(wsFullPath, ...
                    'VariableName', sprintf('%s_%s', varName, moduleBaseName), ...
                    'SaveFormat', 'StructureWithTime', ...
                    'SampleTime', '-1', 'Decimation', '1');
                % Position To Workspace block to the right of probe
                set_param(wsFullPath, 'Position', ...
                    [probeX + xWSOffset, probeY + (i-1)*ySignalGap, ...
                     probeX + xWSOffset + 80, probeY + (i-1)*ySignalGap + 20]);
            end

            % Connect probe output to To Workspace
            try
                add_line(subsysName, sprintf('%s/%d', probeBlkName, i), sprintf('%s/1', wsBlkName), 'autorouting','on');
            catch
                % skip if line exists
            end
        end
    end

    % Auto-arrange subsystem layout
    Simulink.BlockDiagram.arrangeSystem(subsysName);
    fprintf('✅ All 32 modules added and organized in grid inside "%s" subsystem.\n', subsysName);
end