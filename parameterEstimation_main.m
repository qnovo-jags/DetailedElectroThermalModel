function [pOpt, Info] = parameterEstimation_main(p, optimModel, dateData)

% Set optimization method: "Simplex", "Nonlinear Least Squares", "GA",
% "PSO", "Bayesian", "PatternSearch", "SimulatedAnnealing"
% optimModel = "SimulatedAnnealing";
open_system('mainModel')

if nargin < 1
    p = [];
end

Exp = sdo.Experiment('mainModel');

% Load experimental data
Exp_output = [];

j_vals = [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 26, 28, 29, 32];

for idx = 1:length(j_vals)
    i = j_vals(idx);
    Exp_Sig_struct = Simulink.SimulationData.Signal;
    %Exp_Sig_struct.Values    = getData(sprintf('Exp_Sig_Output_Value_T%d', i));
    Exp_Sig_struct.Values    = getDataMeasurements(i, dateData);
    Exp_Sig_struct.BlockPath = sprintf('mainModel/TempProbeBlock%d', i);
    Exp_Sig_struct.PortType  = 'outport';
    Exp_Sig_struct.PortIndex = 1;
    Exp_Sig_struct.Name      = sprintf('T%d', i);
    Exp_output = [Exp_output; Exp_Sig_struct];
end

Exp.OutputData = Exp_output;

% Define parameters to estimate
Param = sdo.getParameterFromModel('mainModel', ...
{'scaledMassModule', ...
'scaledMassCoolant',...
'scaledAdvectiveCoefficient',...
'thermalResistanceModuleToAmbient_0', ...
'thermalResistanceModuleToAmbient_1',...
'thermalResistanceModuleToAmbient_2',...
'thermalResistanceModuleToAmbient_3',...
'thermalResistanceTubeToModule'});

Param(1).Value = 1.2;
Param(2).Value = 0.8;
Param(3).Value = 1.2;
Param(4).Value = 3;
Param(5).Value = 0.5;
Param(6).Value = 1;
Param(7).Value = 1.5;
Param(8).Value = 0.5;

Param(1).Minimum = 0.5;
Param(2).Minimum = 0.5;
Param(3).Minimum = 0.5;
Param(4).Minimum = 0.5;
Param(5).Minimum = 0.5;
Param(6).Minimum = 0.5;
Param(7).Minimum = 0.5;
Param(8).Minimum = 0.5;

Param(1).Maximum = 5;
Param(2).Maximum = 5;
Param(3).Maximum = 5;
Param(4).Maximum = 5;
Param(5).Maximum = 5;
Param(6).Maximum = 5;
Param(7).Maximum = 5;
Param(8).Maximum = 5;

Exp.Parameters = Param;

Simulator = createSimulator(Exp);
s = getValuesToEstimate(Exp);
p = [p; s];
Simulator = setup(Simulator, 'FastRestart', 'off');
SimulatorCleanup = onCleanup(@() restore(Simulator));

lb = [Param.Minimum];
ub = [Param.Maximum];

%% Optimization
switch optimModel
    case "Simplex"
        Options = sdo.OptimizeOptions;
        Options.Method = 'fminsearch';
        Options.OptimizedModel = Simulator;
        Options.MethodOptions.TolX = 1e-2;
        Options.MethodOptions.TolFun = 1e-2;
        Options.MethodOptions.MaxIter = 200;
        Options.MethodOptions.MaxFunEvals = 200;
        optimfcn = @(P) main_optFcn(P, Simulator, Exp, optimModel);
        [pOpt, Info] = sdo.optimize(optimfcn, p, Options);

    case "Nonlinear Least Squares"
        Options = sdo.OptimizeOptions;
        Options.Method = 'lsqnonlin';
        Options.MethodOptions.MaxIter = 50;
        Options.MethodOptions.MaxFunEvals = 50;
        optimfcn = @(P) main_optFcn(P, Simulator, Exp, optimModel);
        [pOpt, Info] = sdo.optimize(optimfcn, p, Options);
    
    case "MultiStart"
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
        problem = createOptimProblem('fmincon', ...
            'objective', objFcn, ...
            'x0', rand(1, numel(Param)), ...
            'lb', lb, ...
            'ub', ub, ...
            'options', optimoptions('fmincon', 'Display', 'none', 'Algorithm', 'interior-point'));
        ms = MultiStart('UseParallel', true, 'Display', 'off');
        [pvec, ~] = run(ms, problem, 20);  % 20 random starts

    case "GlobalSearch"
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
        problem = createOptimProblem('fmincon', ...
            'objective', objFcn, ...
            'x0', rand(1, numel(Param)), ...
            'lb', lb, ...
            'ub', ub, ...
            'options', optimoptions('fmincon', 'Display', 'none'));
        gs = GlobalSearch('Display', 'off');
        [pvec, ~] = run(gs, problem);

    case "GA"
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
        options = optimoptions('ga', ...
            'MaxGenerations', 5, ...
            'PopulationSize', 10, ...
            'Display', 'iter');
        [pvec, ~] = ga(objFcn, numel(Param), [], [], [], [], lb, ub, [], options);
        for i = 1:numel(Param)
            Param(i).Value = pvec(i);
        end
        pOpt = Param;
        Info = [];

    case "PSO"
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
        options = optimoptions('particleswarm', ...
            'SwarmSize', 10, ...
            'MaxIterations', 10, ...
            'Display', 'iter');
        [pvec, ~] = particleswarm(objFcn, numel(Param), lb, ub, options);
        for i = 1:numel(Param)
            Param(i).Value = pvec(i);
        end
        pOpt = Param;
        Info = [];
    case "Bayesian"
        vars = [];
        for i = 1:numel(Param)
            name = Param(i).Name;
            minVal = Param(i).Minimum;
            maxVal = Param(i).Maximum;
            vars = [vars, optimizableVariable(name, [minVal, maxVal])];
        end
    
        objFcn = @(T) wrapperBayesOptFcn(T, Param, Simulator, Exp, optimModel);
    
        results = bayesopt(objFcn, vars, ...
            'MaxObjectiveEvaluations', 50, ...
            'Verbose', 1, ...
            'PlotFcn', {@plotObjectiveModel, @plotMinObjective});
        
        best = results.XAtMinObjective;
        for i = 1:numel(Param)
            Param(i).Value = best.(Param(i).Name);
        end
        pOpt = Param;
        Info = results;
    case "PatternSearch"
        lb = [Param.Minimum];
        ub = [Param.Maximum];
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
  
        options = optimoptions('patternsearch', ...
            'MaxFunctionEvaluations', 50, ...
            'Display', 'iter');
    
        [popt, ~] = patternsearch(objFcn, [Param.Value], [], [], [], [], lb, ub, [], options);
    
        for i = 1:numel(Param)
            Param(i).Value = popt(i);
        end
        pOpt = Param;
        Info = [];
    case "SimulatedAnnealing"
        objFcn = @(x) wrapperCostFunction(x, Param, Simulator, Exp, optimModel);
        options = optimoptions('simulannealbnd', ...
            'MaxFunctionEvaluations', 50, ...
            'Display', 'iter');
        [pvec, ~] = simulannealbnd(objFcn, [Param.Value], lb, ub, options);
        for i = 1:numel(Param)
            Param(i).Value = pvec(i);
        end
        pOpt = Param;
        Info = [];
    otherwise
        error('Unknown optimization method: %s', optimModel);
end

Exp = setEstimatedValues(Exp, pOpt);
sdo.setValueInModel('mainModel', pOpt);
end

%% Cost Function for SDO and Wrapper
function Vals = main_optFcn(P, Simulator, Exp, optimModel)
    persistent hFig hPlotMeasured hPlotExpected evalLog
    
    if isempty(evalLog)
        evalLog = [];
    end

    r = sdo.requirements.SignalTracking('Method', 'Residuals');
    Exp = setEstimatedValues(Exp, P);
    F_r = [];
    Simulator = createSimulator(Exp, Simulator);
    Simulator = sim(Simulator);
    SimLog = find(Simulator.LoggedData, get_param('mainModel','SignalLoggingName'));

    for ctSig = 1:numel(Exp.OutputData)
        Sig = find(SimLog, Exp.OutputData(ctSig).Name);
        Error = evalRequirement(r, Sig.Values, Exp.OutputData(ctSig).Values);
        F_r = [F_r; Error(:)];

        if ctSig == 1
            timeSim = Sig.Values.Time;
            dataSim = Sig.Values.Data;
            timeExp = Exp.OutputData(ctSig).Values.Time;
            dataExp = Exp.OutputData(ctSig).Values.Data;
            if isempty(hFig) || ~isvalid(hFig)
                hFig = figure('Name', 'Signal Comparison', 'NumberTitle', 'off');
                hPlotMeasured = plot(timeSim, dataSim, 'b', 'DisplayName', 'Measured (Simulated)');
                hold on;
                hPlotExpected = plot(timeExp, dataExp, 'r--', 'DisplayName', 'Expected');
                xlabel('Time'); ylabel('Signal Value');
                title(['Signal Comparison: ', Exp.OutputData(ctSig).Name]);
                legend('show'); grid on;
            else
                set(hPlotMeasured, 'XData', timeSim, 'YData', dataSim);
                set(hPlotExpected, 'XData', timeExp, 'YData', dataExp);
                drawnow limitrate;
            end
        end
    end

    if optimModel == "Nonlinear Least Squares"
        Vals.F = F_r;
        costVal = sum(F_r.^2);
    else
        Vals.F = sum(F_r.^2);
        costVal = Vals.F;
    end
    
    evalLog(end+1) = costVal;
    assignin('base', 'currentEvalLog', evalLog);  % expose to caller

    for i = 1:numel(P)
        fprintf('  %s = %.6f\n', P(i).Name, P(i).Value);
    end
    fprintf('Error = %.2f\n', costVal)
    fprintf('--------------------------------------\n');
end

function cost = wrapperCostFunction(xVec, ParamTemplate, Simulator, Exp, optimModel)
    for i = 1:numel(ParamTemplate)
        ParamTemplate(i).Value = xVec(i);
    end
    Vals = main_optFcn(ParamTemplate, Simulator, Exp, optimModel);
    cost = Vals.F;
end

function cost = wrapperBayesOptFcn(T, ParamTemplate, Simulator, Exp, optimModel)
    xVec = zeros(1, numel(ParamTemplate));
    for i = 1:numel(ParamTemplate)
        xVec(i) = T.(ParamTemplate(i).Name);
    end
    cost = wrapperCostFunction(xVec, ParamTemplate, Simulator, Exp, optimModel);
end

function Data = getData(DataID)
    token = regexp(DataID, 'Exp_Sig_Output_Value_T(\d+)', 'tokens');
    if ~isempty(token)
        num = token{1}{1};
        filename = sprintf('./results/Data%s.csv', num);
        if isfile(filename)
            data = readtable(filename);
            t = data.Var1;
            y = data.Var2;
            Data = timeseries(y, t);
        else
            error('File not found: %s', filename);
        end
    else
        error('Unknown DataID format: %s', DataID);
    end
end

function Data = getDataMeasurements(i, dateData)
    % Define file path and name
    out = getInputsByCase(dateData);   
    filepath = out{3};
    filename = sprintf('%sData%d.csv', filepath, i);

    % Check if file exists
    if ~isfile(filename)
        error('File not found: %s', filename);
    end

    % Read CSV file
    data = readtable(filename);

    % Use column names if available, otherwise assume Var1 and Var2
    if width(data) < 2
        error('Expected at least 2 columns in %s', filename);
    end

    t = data{:,1};  % Time values
    y = data{:,2};  % Sensor values

    % Create timeseries object
    Data = timeseries(y, t);
end
