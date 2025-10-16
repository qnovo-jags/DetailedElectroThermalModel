function savePackHealthCSV(filename, capacity_devs, r0_devs, r1_devs, tau1_devs, soc0s, SYPACK)
%SAVEPACKHEALTHCSV Save pack health deviations with cell labels and profiles
%
% Inputs:
%   filename        : string, path to save CSV
%   capacity_devs   : numModules x numCells matrix
%   r0_devs         : numModules x numCells matrix
%   r1_devs         : numModules x numCells matrix
%   tau1_devs       : numModules x numCells matrix
%   soc0s           : numModules x numCells matrix
%   SYPACK          : struct with module_condition_map and damaged_cell_per_module_idxs_1_based

[numModules, numCells] = size(capacity_devs);

% Preallocate profile labels
cell_profiles = strings(numModules, numCells);

% Assign profile for each cell
for module = 1:numModules
    % Default profile for all cells
    cell_profiles(module,:) = "Healthy_BoL";

    % Check each profile in module_condition_map
    profile_names = fieldnames(SYPACK.module_condition_map);
    for k = 1:numel(profile_names)
        modules_in_profile = SYPACK.module_condition_map.(profile_names{k});
        if ismember(module, modules_in_profile)
            damaged_cells = SYPACK.damaged_cell_per_module_idxs_1_based;
            for c = 1:length(damaged_cells)
                cell_idx = damaged_cells(c);
                cell_profiles(module, cell_idx) = profile_names{k};
            end
            break; % stop after first matching profile
        end
    end
end

% Flatten matrices row-wise (module-major)
capacity_flat = reshape(capacity_devs', 1, []);
r0_flat       = reshape(r0_devs', 1, []);
r1_flat       = reshape(r1_devs', 1, []);
tau1_flat     = reshape(tau1_devs', 1, []);
soc0_flat     = reshape(soc0s', 1, []);
cell_profiles_flat = reshape(cell_profiles', 1, []);

% Create cell labels
cell_labels = strings(1, numModules*numCells);
idx = 1;
for m = 1:numModules
    for c = 1:numCells
        cell_labels(idx) = sprintf('Module%02d_Cell%02d', m, c);
        idx = idx + 1;
    end
end

% Create table
T = table(cell_labels', cell_profiles_flat', capacity_flat', r0_flat', r1_flat', tau1_flat', soc0_flat', ...
          'VariableNames', {'CellLabel','Profile','Capacity','R0','R1','Tau1','SOC'});

% Save to CSV
writetable(T, filename);

end
