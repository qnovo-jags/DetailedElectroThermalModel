% Define your grid data
cell_param = ev_pack_cell_parameters();

x = cell_param.TemperatureBreakpointsCell;
y = cell_param.SOCBreakpointsCell;
z = cell_param.OpenCircuitVoltageThermalCell;

F = griddedInterpolant({x, y}, z', 'linear');

[numTemps, numSOCs] = size(z);
if numTemps ~= length(x)
    z = z';
end

% Plot Voc vs SOC for each temperature
figure;
hold on;
colors = lines(length(x));  % Generate distinct colors for each temp

for i = 1:length(x)
    plot(y, z(i, :), 'DisplayName', sprintf('T = %.1f°C', x(i)), ...
         'Color', colors(i, :), 'LineWidth', 1.5);
end

grid on;
xlabel('State of Charge (SOC)');
ylabel('Open Circuit Voltage (Voc) [V]');
title('Open Circuit Voltage vs SOC for Different Temperatures');
legend('show');

temp0 = 7;
packV = 705.5;
% Set known x and z
x_fixed = 273 + temp0;

z_target = packV / 192;
% z_target = 3.75;

y_bounds = [0, 1];

% Solve for y
y_solution = solve_y_given_xz(F, x_fixed, z_target, y_bounds);
disp(['Estimated y: ', num2str(y_solution)]);


function y_out = solve_y_given_xz(F, x_fixed, z_target, y_bounds)
%SOLVE_Y_GIVEN_XZ Solves for y given x and z, using an interpolated function f(x, y) = z
%
%   y_out = solve_y_given_xz(F, x_fixed, z_target, y_bounds)
%
% Inputs:
%   F         - griddedInterpolant object: F(x, y) = z
%   x_fixed   - scalar x value
%   z_target  - scalar z value to solve for
%   y_bounds  - 1x2 vector [y_min, y_max] to bracket the root
%
% Output:
%   y_out     - estimated y such that F(x_fixed, y_out) ≈ z_target

    % Define root-finding function
    fun = @(y) F(x_fixed, y) - z_target;

    % Check if the root is bracketed
    f1 = fun(y_bounds(1))
    f2 = fun(y_bounds(2))

    if f1 * f2 > 0
        error('Root is not bracketed in y_bounds. Try plotting or adjusting the bounds.');
    end

    % Solve using fzero
    y_out = fzero(fun, y_bounds);
end
