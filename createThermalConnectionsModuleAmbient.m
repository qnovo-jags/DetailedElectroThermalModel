function createThermalConnectionsModuleAmbient(modelName,thermalReferencePosition)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

add_block('fl_lib/Thermal/Thermal Elements/Thermal Reference', sprintf('%s/ThermalReference', modelName),...
    "Position", thermalReferencePosition + [0, 0, 30, 30]);
add_block('fl_lib/Thermal/Thermal Sources/Controlled Temperature Source', sprintf('%s/TempSource', modelName),...
    "Position", thermalReferencePosition + [0, 0, 30, 30]);
add_line(modelName, 'ThermalReference/LConn 1', 'TempSource/RConn 2')

constantTemp = [modelName, '/ConstantTemp'];
add_block('fl_lib/Physical Signals/Sources/PS Constant',constantTemp, ...
    "Position", thermalReferencePosition+[50, 100, 70, 120])
set_param(constantTemp,'constant','300' )
add_line(modelName, 'ConstantTemp/RConn 1', 'TempSource/RConn 1')

for i = 1:1:32
    resBlock = sprintf('%s/TR_MA%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
        'Position',thermalReferencePosition+getBlockPosition(i)+[0, -550, 0, -550] , ...
        'ShowName', 'off');
    set_param(resBlock, 'Orientation', 'right');
    % Create strings for the blocks you want to connect
    thermalMass_i_battery = sprintf('ThermalMassBatteries%d',i);
    thermalRes_i    = sprintf('TR_MA%d',i);
    
    % Add lines connecting ThermalMass i to ThermalResistance i
    add_line(modelName, 'TempSource/LConn 1', [thermalRes_i '/LConn 1'], "autorouting", 'on');
    add_line(modelName, [thermalRes_i '/RConn 1'], [thermalMass_i_battery '/LConn 1'], "autorouting", 'on');

end


end