function Data = getDataMeasurements(i, dateData)
    out = getInputsByCase(dateData);
    filepath = out{3};
    filename = fullfile(filepath, sprintf('Data%d.csv', i));

    if ~isfile(filename), error('File not found: %s', filename); end

    T = readtable(filename);
    if width(T) < 2, error('Expected ≥2 columns in %s', filename); end

    t = T{:,1};  y = T{:,2};
    if ~isnumeric(t), t = str2double(string(t)); end
    if ~isnumeric(y), y = str2double(string(y)); end
    if any(isnan(t) | isnan(y)), error('Non-numeric entries in %s', filename); end

    % enforce monotonic time & drop duplicates
    [t, idx] = sort(t(:)); y = y(:); y = y(idx);
    if any(diff(t)==0), [t, u] = unique(t,'stable'); y = y(u); end

    % If your files are °C and model expects K, uncomment:
    % y = y + 273.15;

    Data = timeseries(y, t);
end
