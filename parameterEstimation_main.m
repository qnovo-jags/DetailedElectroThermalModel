function [pOpt,Info] = parameterEstimation_main(p)

open_system('mainModel')

if nargin < 1
    p = [];
end

Exp = sdo.Experiment('mainModel');

Exp_output = [];
for i=1:1:18
    Exp_Sig_struct = Simulink.SimulationData.Signal;
    Exp_Sig_struct.Values    = getData(sprintf('Exp_Sig_Output_Value_T%d',i));
    Exp_Sig_struct.BlockPath = sprintf('mainModel/TempProbeBlock%d', i);
    Exp_Sig_struct.PortType  = 'outport';
    Exp_Sig_struct.PortIndex = 1;
    Exp_Sig_struct.Name      = sprintf('T%d', i);
    Exp_output = [Exp_output; Exp_Sig_struct];
end

Exp.OutputData = Exp_output;
%%
Param = sdo.getParameterFromModel('mainModel', {'massModule', 'massCoolant'});
Param(1).Value = 0.5;
Param(2).Value = 1;
Exp.Parameters = Param;

%%
Simulator = createSimulator(Exp);

s = getValuesToEstimate(Exp);
p = [p; s];

Simulator = setup(Simulator, 'FastRestart', 'off');

SimulatorCleanup = onCleanup(@() restore(Simulator));

%%
optimfcn = @(P) main_optFcn(P,Simulator,Exp);

Options = sdo.OptimizeOptions;
Options.Method = 'fminsearch';
Options.OptimizedModel = Simulator;

Options.MethodOptions.TolX = 1e-2;
Options.MethodOptions.TolFun = 1e-2;
Options.MethodOptions.MaxIter = 30;
Options.MethodOptions.MaxFunEvals = 50;

[pOpt,Info] = sdo.optimize(optimfcn,p,Options);

Exp = setEstimatedValues(Exp,pOpt);

sdo.setValueInModel('mainModel',pOpt(1:0));
end

function Vals = main_optFcn(P, Simulator, Exp)
    persistent hFig hPlotMeasured hPlotExpected

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

        % Plot for the first signal only
        if ctSig == 1
            timeSim = Sig.Values.Time;
            dataSim = Sig.Values.Data;
            timeExp = Exp.OutputData(ctSig).Values.Time;
            dataExp = Exp.OutputData(ctSig).Values.Data;

            % Create persistent figure and plot handles
            if isempty(hFig) || ~isvalid(hFig)
                hFig = figure('Name', 'Signal Comparison', 'NumberTitle', 'off');
                hPlotMeasured = plot(timeSim, dataSim, 'b', 'DisplayName', 'Measured (Simulated)');
                hold on;
                hPlotExpected = plot(timeExp, dataExp, 'r--', 'DisplayName', 'Expected');
                xlabel('Time');
                ylabel('Signal Value');
                title(['Signal Comparison: ', Exp.OutputData(ctSig).Name]);
                legend('show');
                grid on;
            else
                % Update plot data
                set(hPlotMeasured, 'XData', timeSim, 'YData', dataSim);
                set(hPlotExpected, 'XData', timeExp, 'YData', dataExp);
                drawnow limitrate;
            end
        end
    end

    % Return scalar cost
    Vals.F = sum(F_r.^2);

    % Print parameter values
    for i = 1:numel(P)
        fprintf('  %s = %.6f\n', P(i).Name, P(i).Value);
    end
    fprintf('--------------------------------------\n');
end




function Data = getData(DataID)
    token = regexp(DataID, 'Exp_Sig_Output_Value_T(\d+)', 'tokens');
    
    if ~isempty(token)
        num = token{1}{1};  % Extract the number as string
        filename = sprintf('./results/Data%s.csv', num);
    
        % Check if the file exists
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

