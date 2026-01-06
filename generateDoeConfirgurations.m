%% Generate custom profiles for Step Charge

clc;

% === Output Directory ===
PACK_ID = 3;
metadata_dir = sprintf("./sypack192s2p60ah/SYPACK%d/metadata",PACK_ID);

% === User Configuration ===
profileTypes = {'AFC'};               % 'AFC' or 'Step'
sampling_rate_s = 1;                  % [Hz]
initialRestSec = 300;                 % [s]
restBeforeChargeSec = [10, 30, 45, 60, 100, 180, 600, 30*60];        % [s]
chargeCrates = [0.5, 1, 1.5, 2];      % [C-rate]
depth_of_charge = [0.20, 0.30, 0.40, 0.50, 0.60]; % [-]
restAfterChargeSec = [10, 30, 45, 60, 100, 180, 600, 30*60];         % [s]
dischargeCrates = 2;                  % [C]
restAfterDischargeSec = 30*60;        % [s]
numberOfCycles = 1;                   % [-]
ambientTempsKelvin = 273.15 + [25];   % [K]

% === Generate DOE ===
DOE = generateFullFactorialDoeWithRunSequence(metadata_dir, ...
    profileTypes, sampling_rate_s, initialRestSec, ...
    restBeforeChargeSec, chargeCrates, restAfterChargeSec, ...
    dischargeCrates, restAfterDischargeSec, numberOfCycles, ambientTempsKelvin);


%% 2. Generate custom profiles for AFC

% clc;
% 
% % === Output Directory ===
% PACK_ID = 2;
% metadata_dir = sprintf("./sypack192s2p60ah/SYPACK%d/metadata",PACK_ID);
% 
% % === User Configuration ===
% profileTypes = {'AFC'};
% sampling_rate_s = 1;                  % [Hz]
% initialRestSec = 300;                 % [s]
% restBeforeChargeSec = [10, 45, 60, 90];        % [s]
% chargeCrates = [2];      % [C-rate]
% restAfterChargeSec = [10, 45, 60, 90];         % [s]
% dischargeCrates = 2;                  % [C]
% restAfterDischargeSec = 30*60;        % [s]
% numberOfCycles = 1;                   % [-]
% ambientTempsKelvin = 273.15 + [10, 25, 40];   % [K]
% 
% % === Generate DOE ===
% DOE = generateFullFactorialDoeWithRunSequence(metadata_dir, ...
%     profileTypes, sampling_rate_s, initialRestSec, ...
%     restBeforeChargeSec, chargeCrates, restAfterChargeSec, ...
%     dischargeCrates, restAfterDischargeSec, numberOfCycles, ambientTempsKelvin);
