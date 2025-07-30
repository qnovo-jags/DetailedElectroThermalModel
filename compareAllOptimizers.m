function compareAllOptimizers()
% Compare all optimization methods and plot error vs. function evaluations

methods = {"Simplex", "Nonlinear Least Squares", "GA", "PSO", "Bayesian", "PatternSearch", "SimulatedAnnealing"};
colors = lines(numel(methods));

% Preallocate
results = struct();

for i = 1:numel(methods)
    method = methods{i};
    fprintf('\nRunning optimizer: %s\n', method);

    % Call parameter estimation script
    [pOpt, info] = parameterEstimation_main_method(method);

    % Extract error and evaluations count
end

    results(i).method = method;
    results(i).evals = evals;
    results(i).errs = errs;

% Plot
figure;
hold on;
for i = 1:numel(results)
    plot(results(i).evals, results(i).errs, '-', 'DisplayName', results(i).method, 'Color', colors(i,:));
end
xlabel('Function Evaluations');
ylabel('Objective Value');
title('Comparison of Optimization Methods');
legend show;
grid on;
end

function [pOpt, info] = parameterEstimation_main_method(method)
    % Wrapper to call the main estimation with a chosen method
    evalin('base', 'clear currentEvalLog');
    p = [];
    [pOpt, info] = parameterEstimation_main(p, method);
end

function cost = objectiveCost(p)
    % Simple fallback evaluation (if optimizer doesn't return cost)
    Simulator = [];
    Exp = [];
    optimModel = "Simplex";  % doesn't matter here
    Vals = main_optFcn(p, Simulator, Exp, optimModel);
    cost = Vals.F;
end
