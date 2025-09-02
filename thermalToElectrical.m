function thermalToElectrical(modelName)

ThermalReference2 = 'ThermalReferenceInElectricalModel';
add_block('fl_lib/Thermal/Thermal Elements/Thermal Reference', sprintf('%s/%s', modelName, ThermalReference2),...
"Position", [0, 0, 30, 30]);

for i = 1:32
    %add_line(modelName,'CoolantTempSource/LConn 1',sprintf('Module%d/LConn1', i), ...
    %    'autorouting','on')
    moduleTempSourceBlock = sprintf('tempSource%d',i);
    moduleTempSource = sprintf('%s/%s', modelName, moduleTempSourceBlock);

    add_block('fl_lib/Thermal/Thermal Sources/Controlled Temperature Source', moduleTempSource,...
        'Position',getBlockPosition(i)+[50, 70, 50, 70] , ...
        'ShowName', 'off');
    
    add_line(modelName, sprintf("%s/LConn1", ThermalReference2), ...
        sprintf("%s/RConn 2", moduleTempSourceBlock), "autorouting", "on");
    add_line(modelName, sprintf("%s/LConn 1", moduleTempSourceBlock), ...
        sprintf('Module%d/LConn1', i), "autorouting", "on");

    %add_line(modelName,sprintf('ThermalMassBatteries%d/LConn 1', i), sprintf('Module%d/LConn1', i), "autorouting", 'on');

    probePath = [modelName, sprintf('/TempProbeBlock%d', i)];
    targetBlock = [modelName, sprintf('/ThermalMassBatteries%d', i)];
    
    % Add probe block
    add_block('nesl_utility/Probe', probePath, "Position",getBlockPosition(i)+[-10, -30, -30, -10] );

    % Bind probe and set variable to probe
    simscape.probe.setBoundBlock(probePath, targetBlock);
    simscape.probe.setVariables(probePath, ["M.T"]);
    
    converterBlock = sprintf('thermalToElectricalConverter%d', i);
    add_block('nesl_utility/Simulink-PS Converter', ...
        sprintf("%s/%s", modelName, converterBlock), ...
        "Position", getBlockPosition(i)+[-10, -30, -40, -60]);
    set_param(sprintf("%s/%s",modelName, converterBlock), ...
        "Unit", "K");
    %set_param(sprintf("%s/%s",modelName, converterBlock), ...
    %     "AffineConversion", "on");
    set_param(sprintf("%s/%s",modelName, converterBlock), ...
        "FilteringAndDerivatives", "filter");   
       
    add_line(modelName, sprintf('TempProbeBlock%d/1', i), sprintf('%s/1', converterBlock));
    add_line(modelName, sprintf('%s/RConn 1', converterBlock), sprintf("%s/RConn 1", moduleTempSourceBlock));
    % Get output line handle
    portHandles = get_param(probePath, 'PortHandles');
    lineHandle = get_param(portHandles.Outport, 'Line');
    
    % Set custom signal name on the output line
    customSignalName = sprintf('T%d', i);
    set_param(lineHandle, 'Name', customSignalName);
end

end