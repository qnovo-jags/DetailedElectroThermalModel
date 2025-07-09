modelName = 'thermalModel3';
new_system(modelName);
open_system(modelName);

h_connection_list = [30, 29; 31, 30;32, 31; 4, 32; 3, 4; 2, 3; 1,2;...
    5, 6; 6, 7; 7, 8; 8, 28; 28, 27; 27, 26; 26, 25; ...
    9, 10; 10, 11; 11, 12; 12, 24; 24, 23, ; 23, 22; 22, 21; ...
    13, 14; 14, 15; 15, 16; 16, 20; 20, 19; 19, 18; 18, 17;];

v_connection_list = [5, 1; 21, 25; 13, 9];

connectionLists = {h_connection_list, v_connection_list};

%Cooling Plate Cool Channels
for i = 1:32
    blockPath = sprintf('%s/ThermalMassCPCC%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassCPCC%d', modelName, i), ...
        'Position',getBlockPosition(i), ...
        'ShowName', 'off');
    set_param(blockPath, 'BackgroundColor', 'blue');
    set_param(blockPath, 'Orientation', 'down');
end

%Cooling Plate Hot Channels 
for i = 1:32
    blockPath = sprintf('%s/ThermalMassCPHC%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassCPHC%d', modelName, i), 'Position',getBlockPosition(i)+[0, 40, 0, 40], ...
        'ShowName', 'off');
    set_param(blockPath, 'BackgroundColor', 'red');
    set_param(blockPath, 'Orientation', 'up');
end

%Thermal masses for batteries
for i = 1:32
    blockPath = sprintf('%s/ThermalMassBatteries%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassBatteries%d', modelName, i), 'Position',getBlockPosition(i)+[10, -500, 10, -500]);
    set_param(blockPath, 'BackgroundColor', 'yellow');
end

%Thermal Resistances between cooling channels
createThermalConnectionsTube(modelName, connectionLists, "CPCC");
createThermalConnectionsTube(modelName, connectionLists, "CPHC");

%Thermal Resistances between cooling channels and the batteries
createThermalConnectionsTubeModule(modelName)