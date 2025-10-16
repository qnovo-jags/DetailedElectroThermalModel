function saveDOECSV(capacity_devs, r0_devs, r1_devs, tau1_devs, soc0_devs, outputFile)
    % Assumes all inputs are [numModules x numCells]
    [numModules, numCells] = size(capacity_devs);

    numRows = numModules * numCells;

    % Prepare output matrix
    ModuleCol = repelem((1:numModules)', numCells);
    CellCol   = repmat((1:numCells)', numModules, 1);

    dataMatrix = [
        ModuleCol, ...
        CellCol, ...
        reshape(capacity_devs', [], 1), ...
        reshape(r0_devs',       [], 1), ...
        reshape(r1_devs',       [], 1), ...
        reshape(tau1_devs',     [], 1), ...
        reshape(soc0_devs',     [], 1)
    ];

    % Define header
    header = {'Module', 'Cell', 'CapacityPercentDev', 'R0PercentDev', 'R1PercentDev', 'Tau1PercentDev', 'SOC0withDev'};

    % Write to file
    fid = fopen(outputFile, 'w');
    fprintf(fid, '%s,', header{1,1:end-1});
    fprintf(fid, '%s\n', header{1,end});
    fclose(fid);

    writematrix(dataMatrix, outputFile, 'WriteMode', 'append');

    fprintf('DOE CSV saved to: %s\n', outputFile);
end

