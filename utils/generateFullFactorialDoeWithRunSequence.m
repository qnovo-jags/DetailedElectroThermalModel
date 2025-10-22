function DOE = generateFullFactorialDoeWithRunSequence(outputDir, profileTypes, sampling_rate_s, initialRests, ...
                                                       restBeforeCharge, chargeCrates, restAfterCharge, ...
                                                       dischargeCrates, restAfterDischarge, numberOfCycles, ambientTemps)
    % Generate full factorial DOE configurations with run_sequence
    DOE = [];
    
    % Create output directory if missing
    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end

    % Iterate through ambient temperatures
    for atIdx = 1:numel(ambientTemps)
        run_sequence = atIdx;  % run_sequence depends only on ambient temperature
        T = ambientTemps(atIdx);

        for ptIdx = 1:numel(profileTypes)
            profile = profileTypes{ptIdx};

            % If AFC, only use first chargeCrate to avoid duplicates
            if strcmpi(profile, 'AFC')
                crateList = max(chargeCrates);
            else
                crateList = chargeCrates;
            end

            [SF, IR, RBC, CC, RAC, DC, RAD, NC] = ndgrid(1:numel(sampling_rate_s), ...
                1:numel(initialRests), 1:numel(restBeforeCharge), ...
                1:numel(crateList), 1:numel(restAfterCharge), ...
                1:numel(dischargeCrates), 1:numel(restAfterDischarge), ...
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

                % Depth of charge based on crate or AFC
                if crate <= 1
                    depthOfCharge = 0.85;
                elseif strcmpi(profile, 'AFC') || crate <= 1.75
                    depthOfCharge = 0.70;
                else
                    depthOfCharge = 0.55;
                end

                depthOfDischarge = depthOfCharge - 0.10;

                DOE(idx).charge_crate = crate;
                DOE(idx).depth_of_charge = depthOfCharge;
                DOE(idx).depth_of_discharge = depthOfDischarge;

                DOE(idx).rest_after_charge_s = restAfterCharge(RAC(i));
                DOE(idx).discharge_crate = dischargeCrates(DC(i));
                DOE(idx).rest_after_discharge_s = restAfterDischarge(RAD(i));
                DOE(idx).number_of_cycles = numberOfCycles(NC(i));
                DOE(idx).ambient_temperature_K = T;
            end
        end
    end

    % === Save Outputs ===
    DOE_table = struct2table(DOE);
    csvFile = fullfile(outputDir, 'doe_config.csv');
    matFile = fullfile(outputDir, 'doe_config.mat');

    writetable(DOE_table, csvFile);
    save(matFile, 'DOE');

    fprintf('✅ DOE configuration saved:\n   • CSV: %s\n   • MAT: %s\n', csvFile, matFile);
end
