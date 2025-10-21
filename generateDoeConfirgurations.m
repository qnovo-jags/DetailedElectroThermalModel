%% Generate DOE Configuration

clc;

% === Output Directory ===
PACK_ID = 2;
metadata_dir = sprintf("./sypack192s2p60ah/SYPACK%d/metadata",PACK_ID);

% === User Configuration ===
profileTypes = {'Step', 'AFC'};
sampling_rate_s = 1;                  % [Hz]
initialRestSec = 300;                 % [s]
restBeforeChargeSec = [30*60];        % [s]
chargeCrates = [0.5, 1, 1.5, 2];      % [C-rate]
restAfterChargeSec = [30*60];         % [s]
dischargeCrates = 2;                  % [C]
restAfterDischargeSec = 30*60;        % [s]
numberOfCycles = 2;                   % [-]
ambientTempsKelvin = 273.15 + [25];   % [K]

% === Generate DOE ===
DOE = generateFullFactorialDoeWithRunSequence(metadata_dir, ...
    profileTypes, sampling_rate_s, initialRestSec, ...
    restBeforeChargeSec, chargeCrates, restAfterChargeSec, ...
    dischargeCrates, restAfterDischargeSec, numberOfCycles, ambientTempsKelvin);
