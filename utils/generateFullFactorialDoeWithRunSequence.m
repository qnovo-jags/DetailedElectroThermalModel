function DOE = generateFullFactorialDoeWithRunSequence( ...
        outputDir, profileTypes, sampling_rate_s, initialRests, ...
        restBeforeCharge, chargeCrates, restAfterCharge, ...
        dischargeCrates, restAfterDischarge, numberOfCycles, ...
        ambientTemps, starting_soc_charge, depthOfCharge)

    DOE = [];

    % ---- depthOfCharge handling ----
    if nargin < 13 || isempty(depthOfCharge)
        useAutoDepthOfCharge = true;
        depthOfCharge = NaN;   % placeholder for ndgrid
    else
        validateattributes(depthOfCharge, {'numeric'}, ...
            {'vector','>',0,'<',1}, mfilename, 'depthOfCharge');
        useAutoDepthOfCharge = false;
    end

    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end

    for atIdx = 1:numel(ambientTemps)
        run_sequence = atIdx;
        T = ambientTemps(atIdx);

        for ptIdx = 1:numel(profileTypes)
            profile = profileTypes{ptIdx};

            % AFC uses only max C-rate
            if strcmpi(profile, 'AFC')
                crateList = max(chargeCrates);
            else
                crateList = chargeCrates;
            end

            % ---- Full factorial grid ----
            [SF, IR, RBC, CC, DOC, RAC, DC, RAD, NC] = ndgrid( ...
                1:numel(sampling_rate_s), ...
                1:numel(initialRests), ...
                1:numel(restBeforeCharge), ...
                1:numel(crateList), ...
                1:numel(depthOfCharge), ...
                1:numel(restAfterCharge), ...
                1:numel(dischargeCrates), ...
                1:numel(restAfterDischarge), ...
                1:numel(numberOfCycles));

            totalComb = numel(SF);

            for i = 1:totalComb
                idx = numel(DOE) + 1;

                DOE(idx).doe_id = sprintf('doe%d', idx);
                DOE(idx).run_sequence = run_sequence;
                DOE(idx).profileType = profile;
                DOE(idx).sampling_rate_s = sampling_rate_s(SF(i));
                DOE(idx).initial_rest_s = initialRests(IR(i));
                DOE(idx).rest_before_charge_s = restBeforeCharge(RBC(i));

                crate = crateList(CC(i));
                DOE(idx).charge_crate = crate;

                % ---- Depth of Charge logic ----
                if useAutoDepthOfCharge
                    if crate <= 1
                        doc = 0.85;
                    elseif strcmpi(profile, 'AFC') || crate <= 1.75
                        doc = 0.70;
                    else
                        doc = 0.55;
                    end
                else
                    doc = depthOfCharge(DOC(i));
                end

                DOE(idx).depth_of_charge = doc;
                DOE(idx).depth_of_discharge = doc - 0.10;

                DOE(idx).rest_after_charge_s = restAfterCharge(RAC(i));
                DOE(idx).discharge_crate = dischargeCrates(DC(i));
                DOE(idx).rest_after_discharge_s = restAfterDischarge(RAD(i));
                DOE(idx).number_of_cycles = numberOfCycles(NC(i));
                DOE(idx).ambient_temperature_K = T;
                DOE(idx).starting_soc_charge = starting_soc_charge;
            end
        end
    end

    % ---- Save outputs ----
    DOE_table = struct2table(DOE);
    csvFile = fullfile(outputDir, 'doe_config.csv');
    matFile = fullfile(outputDir, 'doe_config.mat');

    writetable(DOE_table, csvFile);
    save(matFile, 'DOE');

    fprintf('✅ DOE configuration saved:\n   • CSV: %s\n   • MAT: %s\n', ...
        csvFile, matFile);
end
