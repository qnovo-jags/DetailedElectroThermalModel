function se_data = extractSeDataProbe(simout, output_dir, target_id, is_qnovo_format, sampling_rate_s)
% saveSimulationData
% Extract, resample, and save time, current, voltage, temperature, and SOC 
% from Simulink To-Workspace outputs.
%
% Inputs:
%   simout           - struct with all To-Workspace outputs
%   output_dir       - folder to save results
%   is_qnovo_format  - logical flag; if true, saves Qnovo-style arrays
%
% Output:
%   se_data - struct with:
%       .original  - unmodified time series
%       .resampled - resampled to uniform grid
%       .simout    - original simout struct


nModules = 32;
nSE_per_module = 6;
% nCellsPerModule = 12;

% --- Base time reference ---
time = simout.vParallelAssembly_Module1.time; 
N = numel(time);

currents = zeros(N, nModules * nSE_per_module);
voltages     = zeros(N, nModules * nSE_per_module);
temperatures = zeros(N, nModules * nSE_per_module);
socs         = zeros(N, nModules * nSE_per_module);

% --- Extract from simout ---
for m = 1:nModules
    % Voltage (6 SE)
    vField = sprintf('vParallelAssembly_Module%d', m);
    vVals = simout.(vField).signals.values;       % shape: [6×1×N]
    voltages(:, (m-1)*nSE_per_module + (1:nSE_per_module)) = squeeze(vVals)';

    % SOC (6 SE)
    socField = sprintf('socParallelAssembly_Module%d', m);
    socVals = simout.(socField).signals.values;   % shape: [6×1×N]
    socs(:, (m-1)*nSE_per_module + (1:nSE_per_module)) = squeeze(socVals)';

    % Temperature (avg of 12 cells → repeated for 6 SE)
    tField = sprintf('batteryTemperature_Module%d', m);
    tVals = simout.(tField).signals.values;       % shape: [12×1×N]
    for pa = 1:nSE_per_module
        idx = (pa-1)*2 + (1:2);                % cells in this parallel assembly
        tAvg = mean(squeeze(tVals(idx,:,:)),1);% 1×N average temperature
        temperatures(:, (m-1)*nSE_per_module + pa) = tAvg'; % assign to correct SE column
    end

    % Current (sum of 2 cells → module current)
    cField = sprintf('batteryCurrent_Module%d', m);
    cVals = simout.(cField).signals.values;       % [12×1×N]
    for pa = 1:nSE_per_module
        idx = (pa-1)*2 + (1:2);                 % cells belonging to this parallel assembly
        cPack = squeeze(sum(cVals(idx,:,:),1)); % sum over 2 cells → 1×N
        currents(:, (m-1)*nSE_per_module + pa) = cPack'; % assign to corresponding column
    end
    
end

% --- Build original data ---
values_orig = [currents, voltages, temperatures, socs];  % [N x (4*nModules*nSE_per_module)]

% --- Resample to uniform grid ---
time_resampled = (time(1):sampling_rate_s:time(end))';
values_res = interp1(time, values_orig, time_resampled, 'linear', 'extrap');

% --- Build tables ---
if is_qnovo_format
    to_str_array = @(X) arrayfun(@(i) "[" + join(string(X(i,:)), ", ") + "]", ...
        (1:size(X,1))', 'UniformOutput', false);

    nSE_total = nModules * nSE_per_module;

    se_data.original = table(time, ...
        to_str_array(values_orig(:, 1:nSE_total)), ...                  % se_currents_A
        to_str_array(values_orig(:, nSE_total+1:2*nSE_total)), ...     % se_voltages_V
        to_str_array(values_orig(:, 2*nSE_total+1:3*nSE_total)), ...   % se_temperatures_K
        to_str_array(values_orig(:, 3*nSE_total+1:4*nSE_total)), ...   % se_socs
        'VariableNames', {'time_s','se_currents_A','se_voltages_V','se_temperatures_K','se_socs'});

    se_data.resampled = table(time_resampled, ...
        to_str_array(values_res(:, 1:nSE_total)), ...                  % se_currents_A
        to_str_array(values_res(:, nSE_total+1:2*nSE_total)), ...     % se_voltages_V
        to_str_array(values_res(:, 2*nSE_total+1:3*nSE_total)), ...   % se_temperatures_K
        to_str_array(values_res(:, 3*nSE_total+1:4*nSE_total)), ...   % se_socs
        'VariableNames', {'time_s','se_currents_A','se_voltages_V','se_temperatures_K','se_socs'});
else
    se_data.original = array2table([time, values_orig], ...
        'VariableNames', [{'time_s'}, strcat("val_", string(1:size(values_orig,2)))]);

    se_data.resampled = array2table([time_resampled, values_res], ...
        'VariableNames', [{'time_s'}, strcat("val_", string(1:size(values_res,2)))]);
end

se_data.simout = simout;

% --- Save Files ---
orig_dir = fullfile(output_dir, 'original');
res_dir  = fullfile(output_dir, 'resample');
mat_dir  = fullfile(output_dir, 'mat_format');
cellfun(@(d) ~exist(d,'dir') && mkdir(d), {orig_dir, res_dir, mat_dir});

% Save the logs
writetable(se_data.original, fullfile(orig_dir, sprintf('%s.csv', target_id)));
fprintf('Original data saved: %s\n', fullfile(orig_dir, sprintf('%s.csv', target_id)));
writetable(se_data.resampled, fullfile(res_dir, sprintf('%s.csv', target_id)));
fprintf('Resampled data saved: %s\n', fullfile(res_dir, sprintf('%s.csv', target_id)));
save(fullfile(mat_dir, sprintf('%s.mat', target_id)), 'se_data', '-v7.3');
fprintf('MAT file saved: %s\n', fullfile(mat_dir, sprintf('%s.mat', target_id)));
end