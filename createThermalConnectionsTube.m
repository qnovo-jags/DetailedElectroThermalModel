function createThermalConnectionsTube(modelName, connectionLists, suffix, thermalReferencePosition)

h_connection_list = connectionLists{1};
v_connection_list = connectionLists{2};

if(suffix=="CPCC")
    offset = [0, -40, 0, -40];
else
    offset = [0, 80, 0, 80];
end

for i = 1:length(h_connection_list)
    next_section = h_connection_list(i, 1);
    current_section = h_connection_list(i, 2);
    %resBlock = sprintf('%s/ThermalResistance%s%d', modelName, suffix, i);
    coolantBlock = sprintf('%s/Coolant%s%d', modelName, suffix, i);
    %add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
    %    'Position',thermalReferencePosition+(getBlockPosition(left)+getBlockPosition(right))/2+offset , ...
    %    'ShowName', 'off');
    add_block('coolantFlow_lib/CoolantFlow2to3', coolantBlock,...
        'Position',thermalReferencePosition+(getBlockPosition(next_section)+getBlockPosition(current_section))/2+offset , ...
        'ShowName', 'off','Orientation','up')

    % Create strings for the blocks you want to connect
    thermalMass_i   = sprintf('ThermalMass%s%d', suffix, next_section);
    thermalMass_ip1 = sprintf('ThermalMass%s%d',  suffix, current_section);
    %thermalRes_i    = sprintf('ThermalResistance%s%d', suffix, i);
    coolant_i = sprintf('Coolant%s%d', suffix, i);

    % Add lines connecting ThermalMass i to ThermalResistance i
    if(suffix == "CPCC")
        add_line(modelName, [thermalMass_ip1 '/LConn 1'], [coolant_i '/LConn2'], 'autorouting', 'on');
        add_line(modelName, [coolant_i '/LConn3'], [thermalMass_i '/LConn 1'], 'autorouting', 'on');
    else
        add_line(modelName, [thermalMass_ip1 '/LConn 1'], [coolant_i '/LConn3'], 'autorouting', 'on');
        add_line(modelName, [coolant_i '/LConn2'], [thermalMass_i '/LConn 1'], 'autorouting', 'on');
    end        
    add_line(modelName,'AdvectiveCoeff/RConn 1',[coolant_i '/LConn1'], 'autorouting', 'on');
end
for i = 1:length(v_connection_list)
    top = v_connection_list(i, 1);
    bottom = v_connection_list(i, 2);
    % resBlock = sprintf('%s/ThermalResistance%s%d', modelName, suffix, i+length(h_connection_list));
    % add_block('fl_lib/Thermal/Thermal Elements/Thermal Resistance', resBlock,...
    %     'Position',thermalReferencePosition+(getBlockPosition(top)+getBlockPosition(bottom))/2 , ...
    %     'ShowName', 'off');
    coolantBlock = sprintf('%s/Coolant%s%d', modelName, suffix,  i+length(h_connection_list));
    add_block('coolantFlow_lib/CoolantFlow2to3', coolantBlock,...
    'Position',thermalReferencePosition+(getBlockPosition(top)+getBlockPosition(bottom))/2+offset , ...
    'ShowName', 'off','Orientation','up')

    % Create strings for the blocks you want to connect
    thermalMass_i   = sprintf('ThermalMass%s%d',  suffix,top);
    thermalMass_ip1 = sprintf('ThermalMass%s%d', suffix,bottom);
    coolant_i = sprintf('Coolant%s%d', suffix, i+length(h_connection_list));
    %thermalRes_i    = sprintf('ThermalResistance%s%d', suffix,i+length(h_connection_list));
    
    % Add lines connecting ThermalMass i to ThermalResistance i
    if(suffix=="CPCC")
        add_line(modelName, [thermalMass_ip1 '/LConn 1'], [coolant_i '/LConn2'], 'autorouting', 'on');
        add_line(modelName, [coolant_i '/LConn3'], [thermalMass_i '/LConn 1'], 'autorouting', 'on');
    else
        add_line(modelName, [thermalMass_ip1 '/LConn 1'], [coolant_i '/LConn3'], 'autorouting', 'on');
        add_line(modelName, [coolant_i '/LConn2'], [thermalMass_i '/LConn 1'], 'autorouting', 'on');
    end        
    
    add_line(modelName,'AdvectiveCoeff/RConn 1',[coolant_i '/LConn1'], 'autorouting', 'on');
end