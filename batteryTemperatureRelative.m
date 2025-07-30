function batteryTemperatureRelative(T_all, time_series)

% Plot setup
% Assumes: T_all = 32 x N matrix, time_series = 1 x N vector
figure;
hold on;
axis equal;
axis off;

% Define custom red-to-blue colormap (256 entries)
cmap = flipud(jet(256));  % red to blue

nColors = size(cmap, 1);

% Setup plot
figure;
hold on;
axis equal;
axis off;

% Create block rectangles
blocks = gobjects(32, 1);
for i = 1:32
    pos = getBlockPosition(i);
    w = pos(3) - pos(1);
    h = pos(4) - pos(2);
    blocks(i) = rectangle('Position', [pos(1), pos(2), w, h], ...
                          'FaceColor', 'k', 'EdgeColor', 'k');
end

% Dummy colorbar (static range)
colormap(cmap);
cb = colorbar;
cb.Label.String = 'Normalized Temp (0 → blue, 1 → red)';
clim([0, 1]);  % dummy normalization for visual context

% Animation loop
N = size(T_all, 2);
for t = 1:N
    T_frame = T_all(:, t);
    T_min = min(T_frame);
    T_max = max(T_frame);

    % Avoid divide-by-zero
    if T_max == T_min
        normT = 0.5 * ones(size(T_frame));  % flat gray
    else
        normT = (T_frame - T_min) / (T_max - T_min);  % normalize [0,1]
    end

    for i = 1:32
        colorIdx = round(normT(i) * (nColors - 1)) + 1;
        colorIdx = min(max(colorIdx, 1), nColors);
        set(blocks(i), 'FaceColor', cmap(colorIdx, :));
    end

    title(sprintf('Time = %.2f s', time_series(t)), 'FontSize', 14);
    drawnow;
    pause(0.05);
end

end