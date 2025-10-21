
clc 
%clear all 
close all

%%

run("./constant_parameters.m")
load("DOE_configs.mat", "DOE");

DOE_ID = 1;

% setupDOE(DOE, DOE_ID);

compilePackModel(DOE, DOE_ID);
setupCurrentInput(DOE, DOE_ID);

%%

% Module01.BatteryCapacityCellPercentDeviation(1) = -40

modelName = 'mainModelDOE';
open_system(modelName);

Qnom = 60;
samplingFrequency = 1;
RestTime0 = 300; 
RestTime1 = 600; 
chargeRate = 2; 
RestTime2 = 600;
dischargeRate = 2;
RestTime3 = 3600; 
numChargeCycles = 10;

currentData = multicCycleSampler(60, 1, 300, 300, 1, 300, 2, 3600, 2);

assignin("base", "currentData", currentData);

% Always start clean
set_param(modelName, 'FastRestart', 'on');

in = Simulink.SimulationInput('mainModelDOE');
in = in.setVariable('AmbientTemperature', 298);  % K
% in = in.setVariable('AmbientTemperature', 328);  % K


stop_time = currentData(end,1);
in = in.setModelParameter('StartTime', '0', 'StopTime', num2str(stop_time));
% in = in.setModelParameter('StartTime', '0', 'StopTime', '20000');  % Reset times

% Run simulation
simOut = sim(in);  % Important: use 'in' to override model parameters
% simOut = sim(modelName);

simlog = simscape.logging.getSimulationLog(modelName);

%%

% Loop through all 32 battery blocks
numModules = 32;

for i = 1:numModules
    blockName = sprintf('ThermalMassBatteries%d', i);
    T_series = simlog.(blockName).M.T.series.values;
    time_series = simlog.(blockName).M.T.series.time;

    % Save CSV
    data_matrix = [time_series(:), T_series(:)];
    doe_name = strcat("DOE",num2str(DOE_ID));
    
    folderPath = sprintf('./Results/%s', doe_name);
    filename = sprintf('%s/Data%d.csv', folderPath, i);
    
    % Create the folder if it doesn't exist
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
    
    % Write the matrix to the file
    writematrix(data_matrix, filename);
end


for i = 1:numModules
    Module = sprintf('Module%d',i);
    doe_name = strcat("DOE",num2str(DOE_ID));
    folderPath = sprintf('./Results/%s/Module%d', doe_name, i);
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
    for pAssembly = 1:6
        se_voltage = simlog.(Module).ParallelAssembly1(pAssembly).vParallelAssembly.series.values;
        time_s = simlog.(Module).ParallelAssembly1(pAssembly).vParallelAssembly.series.time;
        cell_currents = simlog.(Module).ParallelAssembly1(pAssembly).batteryCurrent.series.values;
        se_current = cell_currents(:,1) + cell_currents(:,2);
        se_soc = simlog.(Module).ParallelAssembly1(pAssembly).socParallelAssembly.series.time;
        filename = sprintf('%s/Data%d.csv', folderPath, pAssembly);
        % data_matrix = [time_series(:), v_series(:)];
        writematrix(data_matrix, filename);
    end

end

% plotVITforDOE(DOE_ID);

% batteryTemperaturePlots2(T_all, time_series)
% plotAllModuleTemperatures()
%plotPackIVwithMeasured(simOut, out{5}, "./simResults/")


ti   = simOut.SimulationMetadata.TimingInfo;    % struct of timings
tInit = ti.InitializationElapsedWallTime;     % "compile"/update-diagram time
tExec = ti.ExecutionElapsedWallTime;          % simulation execution time
tTerm = ti.TerminationElapsedWallTime;        % shutdown time (if available)
tTotal = ti.TotalElapsedWallTime;             % total wall time

fprintf('Init: %.3fs | Exec: %.3fs | Term: %.3fs | Total: %.3fs\n', ...
        tInit, tExec, tTerm, tTotal);