function createThermalConnectionsModuleHeatgen(modelName, thermalReferencePosition)

for i = 1:1:32
    heatBlock = sprintf('%s/heat%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Sources/Controlled Heat Flow Rate Source', heatBlock,...
        'Position',thermalReferencePosition+getBlockPosition(i)+[0, -550, 0, -550] , ...
        'ShowName', 'off');
    
    heat_i =  sprintf('heat%d',i);
    thermalMass_i_battery = sprintf('ThermalMassBatteries%d',i);

    add_line(modelName, 'ThermalReference/LConn 1', [heat_i '/RConn 2'], 'autorouting', 'on')
    add_line(modelName, [heat_i '/LConn 1'], [thermalMass_i_battery '/LConn 1'], 'autorouting', 'on')

end

end
