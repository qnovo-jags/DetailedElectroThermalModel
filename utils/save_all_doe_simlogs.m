function save_all_doe_simlogs(filtered_DOE, simulation_results, numModules, output_dir, is_qnovo_format)
% save_all_doe_simlogs
% Loops through all DOE entries in filtered_DOE, extracts SE data, saves CSVs,
% and stores results in a struct keyed by doe_id
%
% Inputs:
%   filtered_DOE    - Struct array of DOE configurations (filtered by run_sequence)
%   simulation_results - Struct keyed by doe_id, each field contains .simlog
%   numModules      - Number of modules (e.g., 32)
%   output_dir      - Base folder to save CSVs
%   is_qnovo_format - 1: store SE data as "[I1,I2,...]", 0: expanded columns
%
% Output:
%   all_results - Struct keyed by DOE ID, each field is the se_data struct
%                 with fields: simlog, original, resampled

    nDOE = length(filtered_DOE);
    all_results = struct();

    % Create MAT folder if it doesn't exist
    mat_dir = fullfile(output_dir, 'mat_format');
    if ~exist(mat_dir, 'dir'), mkdir(mat_dir); end

    for k = 1:nDOE
        target_id = filtered_DOE(k).doe_id;

        % Get the simlog from the simulation_results struct
        simlog = simulation_results.(target_id).simlog;
        fprintf("Processing DOE: %s (%d of %d)\n", target_id, k, nDOE);

        % Extract SE-level data and save CSVs
        se_data = extractSEData(simlog, numModules, output_dir, target_id, is_qnovo_format);

        % Store the se_data struct under doe_id
        all_results.(target_id) = se_data;

        % Save individual MAT file per DOE
        mat_filename = fullfile(mat_dir, sprintf("%s.mat", target_id));
        save(mat_filename, 'se_data', '-v7.3');
        fprintf("Saved MAT for DOE %s: %s\n", target_id, mat_filename);
    end

    fprintf("All DOE simulations processed. CSVs saved in '%s', MAT files saved in '%s'\n", output_dir, mat_dir);
end
