function createThermalConnectionsTubeModule(modelName, suffix, thermalReferencePosition)


for i = 1:1:32
    resBlock = sprintf('%s/TR_TM%s%d', modelName, suffix, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
        'Position',thermalReferencePosition+getBlockPosition(i)+[0, -550, 0, -550] , ...
        'ShowName', 'off');
    set_param(resBlock, 'Orientation', 'up');
    % Create strings for the blocks you want to connect
    thermalMass_i   = sprintf('ThermalMass%s%d',  suffix,i);
    thermalMass_i_battery = sprintf('ThermalMassBatteries%d',i);
    thermalRes_i    = sprintf('TR_TM%s%d', suffix,i);
    
    % Add lines connecting ThermalMass i to ThermalResistance i
    add_line(modelName, [thermalMass_i '/LConn 1'], [thermalRes_i '/LConn 1'], "autorouting", 'on');
    add_line(modelName, [thermalRes_i '/RConn 1'], [thermalMass_i_battery '/LConn 1'], "autorouting", 'on');

end

end