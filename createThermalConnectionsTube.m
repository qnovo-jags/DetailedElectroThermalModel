function createThermalConnectionsTube(modelName, connectionLists, suffix)

h_connection_list = connectionLists{1};
v_connection_list = connectionLists{2};

if(suffix=="CPCC")
    offset = [0, -40, 0, -40];
else
    offset = [0, 80, 0, 80];
end


for i = 1:length(h_connection_list)
    left = h_connection_list(i, 1);
    right = h_connection_list(i, 2);
    resBlock = sprintf('%s/ThermalResistance%s%d', modelName, suffix, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
        'Position',(getBlockPosition(left)+getBlockPosition(right))/2+offset , ...
        'ShowName', 'off');
    
    % Create strings for the blocks you want to connect
    thermalMass_i   = sprintf('ThermalMass%s%d', suffix, left);
    thermalMass_ip1 = sprintf('ThermalMass%s%d',  suffix, right);
    thermalRes_i    = sprintf('ThermalResistance%s%d', suffix, i);
    
    % Add lines connecting ThermalMass i to ThermalResistance i
    add_line(modelName, [thermalMass_i '/LConn 1'], [thermalRes_i '/LConn 1']);
    add_line(modelName, [thermalRes_i '/RConn 1'], [thermalMass_ip1 '/LConn 1']);
end
for i = 1:length(v_connection_list)
    top = v_connection_list(i, 1);
    bottom = v_connection_list(i, 2);
    resBlock = sprintf('%s/ThermalResistance%s%d', modelName, suffix, i+length(h_connection_list));
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
        'Position',(getBlockPosition(top)+getBlockPosition(bottom))/2 , ...
        'ShowName', 'off');
    set_param(resBlock, 'Orientation', 'down');
    % Create strings for the blocks you want to connect
    thermalMass_i   = sprintf('ThermalMass%s%d',  suffix,top);
    thermalMass_ip1 = sprintf('ThermalMass%s%d', suffix,bottom);
    thermalRes_i    = sprintf('ThermalResistance%s%d', suffix,i+length(h_connection_list));
    
    % Add lines connecting ThermalMass i to ThermalResistance i
    add_line(modelName, [thermalMass_i '/LConn 1'], [thermalRes_i '/LConn 1']);
    add_line(modelName, [thermalRes_i '/RConn 1'], [thermalMass_ip1 '/LConn 1']);
end