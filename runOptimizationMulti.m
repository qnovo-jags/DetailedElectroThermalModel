clc;
%clear all;
close all;

% --- Model name ---
mdl = 'mainModelNew';

% --- Optimization method ---
method = "PSO";  % or "Nonlinear Least Squares", etc.

procedure = "Validation"; %"Validation" or "Verification"
%Validation is performed against EV data measurements
%Verification is done again simulation results

% --- Cases to include in multi-experiment optimization ---
cases = {'20241211','20250731'};

run("./constant_parameters.m")
run('./BatteryGeneration/thermalCoupled_param.m')

% --- Optional: initial parameter vector (leave [] for defaults)
pInit = [];

open_system(mdl);

% --- Run optimization ---
fprintf('Starting multi-experiment optimization using %s...\n', method);
tic;
[pOpt, Info] = parameterEstimation_multiExp(pInit, mdl, method, cases, procedure);
toc;

% --- Display results ---
disp('Optimized Parameters:');
disp(pOpt);

% --- Save results ---
save('multiExp_OptResults.mat','pOpt','Info','cases','method');
fprintf('Results saved to multiExp_OptResults.mat\n');

% --- Push values into model workspace ---
sdo.setValueInModel(mdl, pOpt);
fprintf('Updated %s with optimized parameters.\n', mdl);

% --- Optional: post-optimization simulation for one case ---
testCase = cases{1};
fprintf('Running post-optimization simulation for %s...\n', testCase);
dateData = testCase; %#ok<NASGU>
simOut = sim(mdl); %#ok<NASGU>
