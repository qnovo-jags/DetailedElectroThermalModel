function inputs = getInputsByCase(caseID)
    switch lower(caseID)  % optional: makes it case-insensitive
        case '20250731'
            initialSOC = 0.37;
            current = readmatrix("C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250731\interpolated_current.csv");
            filepath = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250731\plots_output_uniform_run_clusters_spline\remapped_csvs\';
            ambient = 293;
            raw_data = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250731\cleaned_data.csv';
        case '20250720'
            initialSOC = 0.35;
            current = readmatrix("C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250720\interpolated_current.csv");
            filepath = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250720\plots_output_uniform_run_clusters_spline\remapped_csvs\';
            ambient = 299;
            raw_data = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_250720\cleaned_data.csv';
        case '20241211'
            initialSOC = 0.43;
            current = readmatrix("C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_241211\interpolated_current.csv");
            filepath = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_241211\plots_output_uniform_run_clusters_spline\remapped_csvs\';
            ambient = 280;
            raw_data = 'C:\Users\mbhattu\Desktop\EV Battery Pack Data Processing Pipeline\Data_241211\cleaned_data.csv';
        otherwise
            error('Unsupported case: %s', caseID);
    end
    inputs = {initialSOC, current, filepath, ambient, raw_data};
end