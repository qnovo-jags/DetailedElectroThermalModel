function inputs = getInputsByCase(caseID)
    switch lower(caseID)  % optional: makes it case-insensitive
        case '20250731'
            initialSOC = 0.39;
            current = readmatrix("C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250731\interpolated_current.csv");
            filepath = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250731\plots_output_uniform_run_clusters_spline\remapped_csvs\';
            ambient = 293;
        case '20250720'
            initialSOC = 0.1;
            current = readmatrix("C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250720\interpolated_current.csv");
            filepath = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250720\plots_output_uniform_run_clusters_spline\remapped_csvs\';
            ambient = 299;
        otherwise
            error('Unsupported case: %s', caseID);
    end
    inputs = {initialSOC, current, filepath, ambient};
end