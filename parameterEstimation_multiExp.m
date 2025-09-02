function [pOpt, Info] = parameterEstimation_multiExp(p, modelName, optimModel, dateDataList, procedure)
% PARAMETERESTIMATION_MULTIEXP  Shared parameter estimation across multiple experiments
% Usage:
%   [pOpt, Info] = parameterEstimation_multiExp([], 'mainModelNew', "Simplex", {'20250731','20250720','20241211'});

open_system(modelName);

if nargin < 1 || isempty(p)
    p = [];
end

% --- Build one sdo.Experiment per dataset ---
numExps = numel(dateDataList);
Exps    = repmat(sdo.Experiment(modelName), 1, numExps);

j_vals = [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29, 32];

perExpParams = cell(1,numExps);
for k = 1:numExps
    dateData = dateDataList{k};
    Exp_output = [];

    for idx = 1:numel(j_vals)
        i = j_vals(idx);
        s = Simulink.SimulationData.Signal;
        if strcmp(procedure, 'Verification')
            s.Values = getDataFromSimulations(i, dateData);
        elseif strcmp(procedure, 'Validation')
            s.Values = getDataMeasurements(i, dateData);
        else
            error("Invalid Procedure")
        end
        s.BlockPath = sprintf('%s/TempProbeBlock%d', modelName, i);
        s.PortType  = 'outport';
        s.PortIndex = 1;
        s.Name      = sprintf('T%d', i);
        Exp_output  = [Exp_output; s]; %#ok<AGROW>
    end

    Exps(k).OutputData = Exp_output;

    out = getInputsByCase(dateData);   % {initialSOC, current, filepath, ambientK}
    initialSoc = out{1};
    currentMat = out{2};         % Nx2 [time(s), current(A)]
    ambientK   = out{4};

    names = {'AmbientTemperature', 'Module1.socCell', 'Module1.batteryTemperature','currentData'};
    perP = [];
    for nm = names
        pObj = sdo.getParameterFromModel(modelName, nm{1});
        switch pObj.Name
            case 'Module1.socCell'
                pObj.Value = initialSoc;
            case 'AmbientTemperature'
                pObj.Value = ambientK;
            case 'Module1.batteryTemperature'
                pObj.Value = ambientK;
            case 'currentData'
                pObj.Value = currentMat;   % numeric matrix is fine
        end
        pObj.Free  = false;     % <-- IMPORTANT: fixed, not estimated
        perP       = [perP; pObj]; %#ok<AGROW>
    end

    % Attach fixed per-experiment params
    Exps(k).Parameters = [Exps(k).Parameters; perP];
end

% --- Shared parameters to estimate (same names as your single-exp code) ---
Param = sdo.getParameterFromModel(modelName, ...
{'scaledMassModule', ...
 'scaledMassCoolant', ...
 'scaledAdvectiveCoefficient', ...
 'thermalResistanceModuleToAmbient_0', ...
 'thermalResistanceModuleToAmbient_1', ...
 'thermalResistanceModuleToAmbient_2', ...
 'thermalResistanceModuleToAmbient_3', ...
 'thermalResistanceTubeToModule', ...
 'scaledCoolantTemp'});

Param(1).Value = 0.8;
Param(2).Value = 4.4144;
Param(3).Value = 4.6456;
Param(4).Value = 1.7836;
Param(5).Value = 0.5;
Param(6).Value = 0.78168;
Param(7).Value = 3.8;
Param(8).Value = 0.5;
Param(9).Value = 0.9717;

Param(1).Minimum = 0.8;
Param(1).Maximum = 1.2;
for ii = 2:numel(Param)-1
    Param(ii).Minimum = 0.5;
    Param(ii).Maximum = 5;
end
Param(9).Minimum = 0.9;
Param(9).Maximum = 1.1;

% Attach shared params to each experiment (required wiring)
for k = 1:numExps
    % Param are your 8 tunables with Free=true (default); per-experiment ones are Free=false
    Exps(k).Parameters = [Param; Exps(k).Parameters]; 
end

% --- Baseline simulator (scalar experiment) + values to estimate ---
SimulatorBase = createSimulator(Exps(1));
s             = getValuesToEstimate(Exps(1));   % from a scalar experiment
p             = [p; s];

SimulatorBase = setup(SimulatorBase, 'FastRestart', 'off');
SimulatorCleanup = onCleanup(@() restore(SimulatorBase)); %#ok<NASGU>

lb = [Param.Minimum];
ub = [Param.Maximum];

%% Optimization (unchanged menu; passes baseline simulator)
switch optimModel
    case "Simplex"
        Options = sdo.OptimizeOptions;
        Options.Method = 'fminsearch';
        Options.OptimizedModel = SimulatorBase;
        Options.MethodOptions.TolX = 1e-2;
        Options.MethodOptions.TolFun = 1e-2;
        Options.MethodOptions.MaxIter = 200;
        Options.MethodOptions.MaxFunEvals = 200;
        optimfcn = @(P) main_optFcn_multi(P, SimulatorBase, Exps, optimModel, modelName);
        [pOpt, Info] = sdo.optimize(optimfcn, p, Options);

    case "fmincon"
        Options = sdo.OptimizeOptions;
        Options.Method = 'fmincon';
        Options.OptimizedModel = SimulatorBase;
        Options.MethodOptions.TolX = 1e-2;
        Options.MethodOptions.TolFun = 1e-2;
        Options.MethodOptions.MaxIter = 200;
        Options.MethodOptions.MaxFunEvals = 200;
        optimfcn = @(P) main_optFcn_multi(P, SimulatorBase, Exps, optimModel, modelName);
        [pOpt, Info] = sdo.optimize(optimfcn, p, Options);

    case "Nonlinear Least Squares"
        Options = sdo.OptimizeOptions;
        Options.Method = 'lsqnonlin';
        Options.MethodOptions.MaxIter = 50;
        Options.MethodOptions.MaxFunEvals = 50;
        optimfcn = @(P) main_optFcn_multi(P, SimulatorBase, Exps, optimModel, modelName);
        [pOpt, Info] = sdo.optimize(optimfcn, p, Options);

    case "MultiStart"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        problem = createOptimProblem('lsqnonlin', ...
                    'objective', objFcn, ...
                    'x0', rand(1, numel(Param)), ...
                    'lb', lb, 'ub', ub, ...
                    'options', optimoptions('fmincon','Display','none','Algorithm','interior-point'));
        ms = MultiStart('UseParallel', true, 'Display', 'off');
        [pvec, ~] = run(ms, problem, 20);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    case "GlobalSearch"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        problem = createOptimProblem('fmincon', ...
                        'objective', objFcn, ...
                        'lb', lb, ...
                        'ub', ub, ...
                        'options', optimoptions('fmincon','Display','none'));

        gs = GlobalSearch('Display', 'off');
        [pvec, ~] = run(gs, problem);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    case "GA"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        options = optimoptions('ga','MaxGenerations',5,'PopulationSize',10,'Display','iter');
        [pvec, ~] = ga(objFcn, numel(Param), [], [], [], [], lb, ub, [], options);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    case "PSO"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        options = optimoptions('particleswarm','SwarmSize',20,'MaxIterations',100,'Display','iter');
        [pvec, ~] = particleswarm(objFcn, numel(Param), lb, ub, options);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    case "Bayesian"
        vars = [];
        for i = 1:numel(Param)
            name   = Param(i).Name;
            minVal = Param(i).Minimum;
            maxVal = Param(i).Maximum;
            vars   = [vars, optimizableVariable(name, [minVal, maxVal])]; %#ok<AGROW>
        end
        objFcn  = @(T) wrapperBayesOptFcn_multi(T, Param, SimulatorBase, Exps, optimModel, modelName);
        results = bayesopt(objFcn, vars, ...
                    'MaxObjectiveEvaluations', 50, ...
                    'Verbose', 1, ...
                    'PlotFcn', {@plotObjectiveModel, @plotMinObjective});
        best = results.XAtMinObjective;
        for i = 1:numel(Param), Param(i).Value = best.(Param(i).Name); end
        pOpt = Param; Info = results;

    case "PatternSearch"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        options = optimoptions('patternsearch','MaxFunctionEvaluations',50,'Display','iter');
        [pvec, ~] = patternsearch(objFcn, [Param.Value], [], [], [], [], lb, ub, [], options);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    case "SimulatedAnnealing"
        objFcn  = @(x) wrapperCostFunction_multi(x, Param, SimulatorBase, Exps, optimModel, modelName);
        options = optimoptions('simulannealbnd','MaxFunctionEvaluations',50,'Display','iter');
        [pvec, ~] = simulannealbnd(objFcn, [Param.Value], lb, ub, options);
        for i = 1:numel(Param), Param(i).Value = pvec(i); end
        pOpt = Param; Info = [];

    otherwise
        error('Unknown optimization method: %s', optimModel);
end

% Push values back
Exps = setEstimatedValues(Exps, pOpt); %#ok<NASGU>
sdo.setValueInModel(modelName, pOpt);
end


%% ---- Multi-experiment cost (reuses baseline simulator) ----
function Vals = main_optFcn_multi(P, SimulatorBase, Exps, optimModel, modelName)
    persistent hFig hPlotMeasured hPlotExpected evalLog logInit evalLogFile paramNames
    % Make them cell arrays for multiple experiments
    if isempty(hFig),           hFig = cell(1,3);           end
    if isempty(hPlotMeasured),  hPlotMeasured = cell(1,3);  end
    if isempty(hPlotExpected),  hPlotExpected = cell(1,3);  end
    if isempty(evalLog), evalLog = []; end

    % -------- optional logging switch --------
    enableLogging = true;  % set true to log every evaluation
    if enableLogging && isempty(logInit)
        logDir = fullfile(pwd,'opt_logs');
        if ~exist(logDir,'dir'), mkdir(logDir); end
        evalLogFile = fullfile(logDir, ['eval_log_' datestr(now,'yyyymmdd_HHMMSS') '.csv']);
        paramNames  = arrayfun(@(pp) pp.Name, P, 'UniformOutput', false);
        hdr = [{'cost'}, paramNames(:)'];
        try
            writematrix(string(hdr), evalLogFile);
        catch
            fid=fopen(evalLogFile,'w'); fprintf(fid,'%s,',hdr{1:end-1}); fprintf(fid,'%s\n',hdr{end}); fclose(fid);
        end
        logInit = true;
    end
    % ----------------------------------------

    r = sdo.requirements.SignalTracking('Method','Residuals');
    Exps = setEstimatedValues(Exps, P);

    F_r = [];
    for k = 1:numel(Exps)
        % reuse compiled model; create sim for this experiment
        SimK = createSimulator(Exps(k), SimulatorBase);
        SimK = sim(SimK);

        SimLog = find(SimK.LoggedData, get_param(modelName,'SignalLoggingName'));

        for ctSig = 1:numel(Exps(k).OutputData)
            Sig   = find(SimLog, Exps(k).OutputData(ctSig).Name);
            Error = evalRequirement(r, Sig.Values, Exps(k).OutputData(ctSig).Values);
            F_r   = [F_r; Error(:)]; %#ok<AGROW>

            % Simple live viz for first exp/first signal
         if ctSig == 1  % only first signal per experiment
            timeSim = Sig.Values.Time;  dataSim = Sig.Values.Data;
            timeExp = Exps(k).OutputData(ctSig).Values.Time;
            dataExp = Exps(k).OutputData(ctSig).Values.Data;
        
            if isempty(hFig{k}) || ~isvalid(hFig{k})
                hFig{k} = figure('Name', sprintf('Signal Comparison (Exp%d / FirstSignal)', k), 'NumberTitle','off');
                hPlotMeasured{k} = plot(timeSim, dataSim, 'b', 'DisplayName','Simulated'); hold on;
                hPlotExpected{k} = plot(timeExp, dataExp, 'r--','DisplayName','Measured');
                xlabel('Time'); ylabel(Exps(k).OutputData(ctSig).Name);
                title(sprintf('Experiment %d Signal Comparison', k));
                legend('show'); grid on;
            else
                set(hPlotMeasured{k}, 'XData', timeSim, 'YData', dataSim);
                set(hPlotExpected{k}, 'XData', timeExp, 'YData', dataExp);
                drawnow limitrate;
            end
         end
        end
    end

    if optimModel == "Nonlinear Least Squares" 
        Vals.F = F_r;                 % vector residuals for LSQ solvers
        costVal = sum(F_r.^2);
    else
        Vals.F = sum(F_r.^2);         % scalar for non-LSQ solvers
        costVal = Vals.F;
    end

    % ---- optional safe logging (never breaks optimization) ----
    if enableLogging
        vals = zeros(1,numel(P));
        for ii = 1:numel(P)
            v = P(ii).Value;
            if isnumeric(v) && ~isempty(v), vals(ii) = v(1); else, vals(ii) = NaN; end
        end
        row = [costVal, vals];
        try
            dlmwrite(evalLogFile, row, '-append');
        catch
            try
                fid=fopen(evalLogFile,'a'); fprintf(fid,[repmat('%.12g,',1,numel(row)-1) '%.12g\n'],row); fclose(fid);
            catch
                % swallow logging errors
            end
        end
    end
    % -----------------------------------------------------------

    evalLog(end+1) = costVal; %#ok<AGROW>
    assignin('base','currentEvalLog', evalLog);
    fprintf('Cost over %d experiments: %.3g\n', numel(Exps), costVal);
end


%% ---- Vectorized wrappers (GA/PSO/etc.) ----
function cost = wrapperCostFunction_multi(xVec, ParamTemplate, SimulatorBase, Exps, optimModel, modelName)
    for i = 1:numel(ParamTemplate)
        ParamTemplate(i).Value = xVec(i);
    end
    Vals = main_optFcn_multi(ParamTemplate, SimulatorBase, Exps, optimModel, modelName);
    cost = Vals.F;   % scalar for non-LSQ branches, vector OK for LSQ if needed
end

function cost = wrapperBayesOptFcn_multi(T, ParamTemplate, SimulatorBase, Exps, optimModel, modelName)
    xVec = zeros(1, numel(ParamTemplate));
    for i = 1:numel(ParamTemplate)
        xVec(i) = T.(ParamTemplate(i).Name);
    end
    cost = wrapperCostFunction_multi(xVec, ParamTemplate, SimulatorBase, Exps, optimModel, modelName);
end

