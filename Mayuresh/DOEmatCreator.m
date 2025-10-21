

DOE(1).Qnom         = 60; % Nominal cell capacity in Ah
DOE(1).samplingFreq = 1;  % Seconds
DOE(1).RestTime0    = 300; % Seconds, initialization rest (before discharge) 
DOE(1).RestTime1    = 300; % Seconds, Rest after first discharge
DOE(1).chargeRate   = 2;   % Charging c-rate
DOE(1).RestTime2    = 300; % Seconds,  Rest after first charge
DOE(1).dischargeRate = 2; % [-], C-rate during discharges
DOE(1).RestTime3    = 300; % Seconds,  Rest after second discharge
DOE(1).numChargeCycles    = 5; % [-], Number of cycles

DOE(1).AmbientTemperature = 298; % Kelvin
DOE(1).scaledMassModule = 0.8;
DOE(1).scaledMassCoolant = 4.8509; 
DOE(1).scaledAdvectiveCoefficient = 4.5932; 
DOE(1).thermalResistanceModuleToAmbient_0 = 1.0269;
DOE(1).thermalResistanceModuleToAmbient_1 = 0.51832;
DOE(1).thermalResistanceModuleToAmbient_2 = 1.1982;
DOE(1).thermalResistanceModuleToAmbient_3 = 2.4342;
DOE(1).thermalResistanceTubeToModule = 0.5;
DOE(1).scaledCoolantTemp = 0.9803;

damaged_module_idxs_1_based = [10, 30]; % index of damaged modules
damaged_cell_idxs_1_based = [3, 4]; % index of damaged cells in each module

DOE(1).Capacity.mean = 0;    
DOE(1).Capacity.std = 2;     

DOE(1).R0.mean = 0;
DOE(1).R0.std = 5;

DOE(1).R1.mean = 0;
DOE(1).R1.std = 0;

DOE(1).Tau1.mean = 0;
DOE(1).Tau1.std = 0;

DOE(1).soc0.mean = 0.20;
DOE(1).soc0.std = 0.0;

%%
DOE(2).Qnom         = 60; % Nominal cell capacity in Ah
DOE(2).samplingFreq = 1;  % Seconds
DOE(2).RestTime0    = 300; % Seconds, initialization rest (before discharge) 
DOE(2).RestTime1    = 300; % Seconds, Rest after first discharge
DOE(2).chargeRate   = 2;   % Charging c-rate
DOE(2).RestTime2    = 300; % Seconds,  Rest after first charge
DOE(2).numChargeCycles    = 1; % [-], Number of cycles
DOE(2).dischargeRate = 2; % [-], C-rate during discharges
DOE(2).RestTime3    = 300; % Seconds,  Rest after second discharge
DOE(2).AmbientTemperature = 298; %Kelvin

DOE(2).scaledMassModule = 0.8;
DOE(2).scaledMassCoolant = 4.8509; 
DOE(2).scaledAdvectiveCoefficient = 4.5932; 
DOE(2).thermalResistanceModuleToAmbient_0 = 1.0269;
DOE(2).thermalResistanceModuleToAmbient_1 = 0.51832;
DOE(2).thermalResistanceModuleToAmbient_2 = 1.1982;
DOE(2).thermalResistanceModuleToAmbient_3 = 2.4342;
DOE(2).thermalResistanceTubeToModule = 0.5;
DOE(2).scaledCoolantTemp = 0.9803;

DOE(2).Capacity.mean = 0;    
DOE(2).Capacity.std = 2;     

DOE(2).R0.mean = 0;
DOE(2).R0.std = 5;

DOE(2).R1.mean = 0;
DOE(2).R1.std = 5;

DOE(2).Tau1.mean = 0;
DOE(2).Tau1.std = 1;

DOE(2).soc0.mean = 0.20;
DOE(2).soc0.std = 0.01;


%%

DOE(3).Qnom         = 60; % Nominal cell capacity in Ah
DOE(3).samplingFreq = 1;  % Seconds
DOE(3).RestTime0    = 300; % Seconds, initialization rest (before discharge) 
DOE(3).RestTime1    = 300; % Seconds, Rest after first discharge
DOE(3).chargeRate   = 2;   % Charging c-rate
DOE(3).RestTime2    = 300; % Seconds,  Rest after first charge
DOE(3).dischargeRate = 2; % [-], C-rate during discharges
DOE(3).RestTime3    = 300; % Seconds,  Rest after second discharge
DOE(3).AmbientTemperature = 298; % Kelvin
DOE(3).numChargeCycles    = 3; % [-], Number of cycles

DOE(3).scaledMassModule = 0.8;
DOE(3).scaledMassCoolant = 4.8509; 
DOE(3).scaledAdvectiveCoefficient = 4.5932; 
DOE(3).thermalResistanceModuleToAmbient_0 = 1.0269;
DOE(3).thermalResistanceModuleToAmbient_1 = 0.51832;
DOE(3).thermalResistanceModuleToAmbient_2 = 1.1982;
DOE(3).thermalResistanceModuleToAmbient_3 = 2.4342;
DOE(3).thermalResistanceTubeToModule = 0.5;
DOE(3).scaledCoolantTemp = 0.9803;

DOE(3).Capacity.mean = 0;    
DOE(3).Capacity.std = 2;     

DOE(3).R0.mean = 0;
DOE(3).R0.std = 5;

DOE(3).R1.mean = 0;
DOE(3).R1.std = 5;

DOE(3).Tau1.mean = 0;
DOE(3).Tau1.std = 5;

DOE(3).soc0.mean = 0.20;
DOE(3).soc0.std = 0.01;

%%

save('DOE_configs.mat', 'DOE');