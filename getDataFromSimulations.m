function Data = getDataFromSimulations(i, dateData)
    % Get file path from helper function

    % Construct filename (with 'DataT' prefix for compatibility)
    filename = sprintf('./Results/%s/Data%d.csv', dateData, i);

    % Check if file exists
    if ~isfile(filename)
        error('File not found: %s', filename);
    end

    % Read the CSV file
    data = readtable(filename);

    % Ensure at least two columns exist
    if width(data) < 2
        error('Expected at least 2 columns in %s', filename);
    end

    % Extract time and data values
    t = data{:, 1};  % Time vector
    y = data{:, 2};  % Measurement values

    % Create timeseries object
    Data = timeseries(y, t);
end
