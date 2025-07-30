caller = dbstack;
if length(caller) <= 1
    % Script is being run independently
    isStandalone = true;
else
    % Script is being called from another script/function
    isStandalone = false;
end

if isStandalone
    modelName = 'thermalModel3';
    new_system(modelName);
    open_system(modelName);
    thermalReferencePosition = [0, 0, 0, 0];
else
    thermalReferencePosition = [1000, 0, 1000, 0];
end

h_connection_list = [30, 29; 31, 30;32, 31; 4, 32; 3, 4; 2, 3; 1,2;...
    6, 5; 7, 6; 8, 7; 28, 8; 27, 28; 26, 27; 25, 26; ...
    22, 21; 23, 22; 24, 23; 12, 24; 11, 12;  10, 11; 9, 10; ...
    14, 13; 15, 14; 16, 15; 20, 16; 19, 20; 18, 19; 17, 18;];

v_connection_list = [5, 1; 21, 25; 13, 9];

connectionLists = {h_connection_list, v_connection_list};

%%
%Thermal Masses : Cooling Plate Cool Channels 
for i = 1:32
    blockPath = sprintf('%s/ThermalMassCPCC%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassCPCC%d', modelName, i), ...
        'Position',thermalReferencePosition+getBlockPosition(i), ...
        'ShowName', 'off');
    set_param(blockPath, 'BackgroundColor', 'blue');
    set_param(blockPath, 'Orientation', 'down');
    set_param(blockPath, 'mass', 'massCoolantScale * scaledMassCoolant')
    set_param(blockPath, 'mass_unit', 'kg')
    set_param(blockPath, 'sp_heat', 'CpCoolant')
    set_param(blockPath, 'sp_heat_unit', 'J/(K*kg)') 
    set_param(blockPath, 'T_priority', 'high');
    set_param(blockPath, "T_specify",'on')
    set_param(blockPath, "T",'AmbientTemperature')
end
%%
%Thermal Masses : Cooling Plate Hot Channels 
for i = 1:32
    blockPath = sprintf('%s/ThermalMassCPHC%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassCPHC%d', modelName, i), 'Position',thermalReferencePosition+getBlockPosition(i)+ [0, 40, 0, 40], ...
        'ShowName', 'off');
    set_param(blockPath, 'BackgroundColor', 'red');
    set_param(blockPath, 'Orientation', 'up');
    set_param(blockPath, 'mass', 'massCoolantScale * scaledMassCoolant')
    set_param(blockPath, 'mass_unit', 'kg')
    set_param(blockPath, 'sp_heat', 'CpCoolant')
    set_param(blockPath, 'sp_heat_unit', 'J/(K*kg)') 
    set_param(blockPath, 'T_priority', 'high');
    set_param(blockPath, "T_specify",'on')
    set_param(blockPath, "T",'AmbientTemperature')
end
%%
%Thermal masses : Modules
for i = 1:32
    blockPath = sprintf('%s/ThermalMassBatteries%d', modelName, i);
    add_block('fl_lib/Thermal/Thermal Elements/Thermal Mass', ...
        sprintf('%s/ThermalMassBatteries%d', modelName, i), 'Position',thermalReferencePosition+getBlockPosition(i)+[10, -600, 10, -600]);
    set_param(blockPath, 'BackgroundColor', 'yellow');
    set_param(blockPath, 'Orientation', 'up');
    set_param(blockPath, 'mass', 'massModule')
    set_param(blockPath, 'mass_unit', 'kg')
    set_param(blockPath, 'sp_heat', 'CpModule')
    set_param(blockPath, 'sp_heat_unit', 'J/(K*kg)')
    set_param(blockPath, 'T_priority', 'high');
    set_param(blockPath, "T_specify",'on')
    set_param(blockPath, "T",'AmbientTemperature')
end

%% %Thermal connections between cooling channels 
%Add an advective coefficient
advectiveCoeff = [modelName, '/AdvectiveCoeff'];
add_block('fl_lib/Physical Signals/Sources/PS Constant',advectiveCoeff, ...
    "Position", thermalReferencePosition+[0, 600, 30, 630])
set_param(advectiveCoeff, 'constant', 'advectiveCoefficientScale * scaledAdvectiveCoefficient')
set_param(advectiveCoeff, "constant_unit", 'W/K')

% Add Custom Thermal Block (heat flow due to advection) between cooling channels
createThermalConnectionsTube(modelName, connectionLists, "CPCC", thermalReferencePosition);
createThermalConnectionsTube(modelName, connectionLists, "CPHC", thermalReferencePosition);
coolantBlock = sprintf('%s/Coolant%s%d', modelName, "hotCoolConnect", ...
    1+2*(length(v_connection_list)+length(h_connection_list)));
add_block('coolantFlow_lib/CoolantFlow2to3', coolantBlock,...
    'Position',thermalReferencePosition+getBlockPosition(17) , ...
    'ShowName', 'off','Orientation','up')

add_line(modelName, 'CoolanthotCoolConnect63/LConn2', 'ThermalMassCPCC17/LConn 1');
add_line(modelName, 'CoolanthotCoolConnect63/LConn3', 'ThermalMassCPHC17/LConn 1');
add_line(modelName,'AdvectiveCoeff/RConn 1','CoolanthotCoolConnect63/LConn1', 'autorouting', 'on');

%%
%Thermal Resistances between cooling channels and the batteries
createThermalConnectionsTubeModule(modelName, "CPCC", thermalReferencePosition)
createThermalConnectionsTubeModule(modelName, "CPHC", thermalReferencePosition)

%%
%Thermal resistance between modules and ambient
createThermalConnectionsModuleAmbient(modelName, thermalReferencePosition)

%% %Boundary conditions for coolant inlet and outlet
coolantTempSource = sprintf('%s/Coolant%s', modelName, "TempSource");
add_block('fl_lib/Thermal/Thermal Sources/Temperature Source', ...
    coolantTempSource, 'Position', thermalReferencePosition+getBlockPosition(29)+[100, 0, 100, 0]);
set_param(coolantTempSource, 'Temperature','coolantTempSourceTemperature')

coolantBC1 = sprintf('%s/Coolant%s%d', modelName, "BC", 1);
add_block('coolantFlow_lib/CoolantFlow2to3', coolantBC1,...
    'Position',thermalReferencePosition+getBlockPosition(29)+[50, 0, 50, 0] , ...
    'ShowName', 'off','Orientation','up')

coolantBC2 = sprintf('%s/Coolant%s%d', modelName, "BC", 2);
add_block('coolantFlow_lib/CoolantFlow2to3', coolantBC2,...
    'Position',thermalReferencePosition+getBlockPosition(29)+[50, 50, 50, 50] , ...
    'ShowName', 'off','Orientation','up')

add_line(modelName, 'CoolantBC1/LConn2','CoolantTempSource/LConn 1','autorouting','on')
add_line(modelName, 'CoolantBC1/LConn3', 'ThermalMassCPCC29/LConn 1','autorouting','on')

add_line(modelName, 'CoolantBC2/LConn2', 'ThermalMassCPHC29/LConn 1','autorouting','on')
add_line(modelName, 'CoolantBC2/LConn3', 'CoolantTempSource/LConn 1','autorouting','on')

add_line(modelName,'AdvectiveCoeff/RConn 1','CoolantBC1/LConn1', 'autorouting', 'on');
add_line(modelName,'AdvectiveCoeff/RConn 1','CoolantBC2/LConn1', 'autorouting', 'on');
%%
%Create a controlled heat flow rate source to be fed from joule heating
%calculations
createThermalConnectionsModuleHeatgen(modelName, thermalReferencePosition)

%%
%Add solver configuration
thermalSolverBlock = [modelName, '/ThermalSolverConfig'];
add_block('nesl_utility/Solver Configuration', thermalSolverBlock, ...
    'Position', thermalReferencePosition+ [-50, 0, -20, 30]);
add_line(modelName, 'ThermalSolverConfig/RConn 1', 'ThermalReference/LConn 1')