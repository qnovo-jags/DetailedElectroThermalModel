function batteryTemperaturePlots2(T_all, time_series)

figure;
hold on;
axis equal;
axis off;

% Precompute color scaling
minT = min(T_all(:));
maxT = max(T_all(:));
cmap = jet(256);  % choose your colormap
nColors = size(cmap, 1);

% Create rectangle handles for all 32 blocks
blocks = gobjects(32, 1);
for i = 1:32
    pos = getBlockPosition(i);
    w = pos(3) - pos(1);
    h = pos(4) - pos(2);
    blocks(i) = rectangle('Position', [pos(1), pos(2), w, h], ...
                          'FaceColor', 'k', 'EdgeColor', 'k');
end

% Add colorbar
colormap(cmap);
cb = colorbar;
clim([minT, maxT]);
cb.Label.String = 'Temperature (K)';

% Animation loop
N = size(T_all, 2);
for t = 1:N
    for i = 1:32
        temp = T_all(i, t);
        colorIdx = round((temp - minT) / (maxT - minT) * (nColors - 1)) + 1;
        colorIdx = min(max(colorIdx, 1), nColors);
        set(blocks(i), 'FaceColor', cmap(colorIdx, :));
    end

    title(sprintf('Time = %.2f s', time_series(t)), 'FontSize', 14);
    drawnow;
    pause(0.05);  % adjust speed as needed
end



end