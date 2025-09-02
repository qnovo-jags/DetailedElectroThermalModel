function plotCumulativeErrorHistogram(dateDataList)
    cumulativeErrors = [];

    for i = 1:numel(dateDataList)
        dateData = dateDataList(i);

        % Get errors without plotting
        errors = plotErrorHistogramAllSensors(dateData, false);

        % Append to cumulative array
        cumulativeErrors = [cumulativeErrors; errors]; %#ok<AGROW>
    end

    % --- Compute percentile bounds ---
    bounds95 = prctile(cumulativeErrors, [2.5, 97.5]);
    bounds90 = prctile(cumulativeErrors, [5, 95]);
    bounds80 = prctile(cumulativeErrors, [10, 90]);

    [counts, edges] = histcounts(cumulativeErrors, 50);
    binCenters = edges(1:end-1) + diff(edges)/2;

    figure('Name', 'Cumulative Error Histogram', 'NumberTitle', 'off');
    yyaxis left
    bar(binCenters, counts, 'BarWidth', 1, 'FaceAlpha', 0.5, 'HandleVisibility', 'off')
    ylabel('Frequency')

    hold on 

    yyaxis right
    bar(binCenters, counts / sum(counts), 'BarWidth', 1, 'FaceAlpha', 0, ...
        'EdgeColor', 'none', 'HandleVisibility', 'off')
    ylabel('Probability')

    % --- Plot histogram ---

    %histogram(cumulativeErrors, 50);
    title('Cumulative Error Histogram Across All Sensors and Dates');
    xlabel('Measurement - Simulation');
    %ylabel('Frequency');
    grid on;

    % --- Plot vertical lines for each confidence level ---
    yLimits = ylim;

    % 95% bounds - red
    g95 = hggroup;
    plot([bounds95(1) bounds95(1)], yLimits, 'r--', 'Parent', g95);
    plot([bounds95(2) bounds95(2)], yLimits, 'r--', 'Parent', g95);
    set(get(get(g95,'Annotation'),'LegendInformation'), 'IconDisplayStyle','on');
    set(g95, 'DisplayName', '95% Bounds');
    
    % 90% bounds - green
    g90 = hggroup;
    plot([bounds90(1) bounds90(1)], yLimits, 'g--', 'Parent', g90);
    plot([bounds90(2) bounds90(2)], yLimits, 'g--', 'Parent', g90);
    set(get(get(g90,'Annotation'),'LegendInformation'), 'IconDisplayStyle','on');
    set(g90, 'DisplayName', '90% Bounds');
    
    % 80% bounds - blue
    g80 = hggroup;
    plot([bounds80(1) bounds80(1)], yLimits, 'b--', 'Parent', g80);
    plot([bounds80(2) bounds80(2)], yLimits, 'b--', 'Parent', g80);
    set(get(get(g80,'Annotation'),'LegendInformation'), 'IconDisplayStyle','on');
    set(g80, 'DisplayName', '80% Bounds');
    
    % Show all bounds in one legend
    legend('show');


    % --- Print to console ---
    fprintf('--- Empirical Confidence Bounds ---\n');
    fprintf('95%% bounds: [%.4f, %.4f]\n', bounds95(1), bounds95(2));
    fprintf('90%% bounds: [%.4f, %.4f]\n', bounds90(1), bounds90(2));
    fprintf('80%% bounds: [%.4f, %.4f]\n', bounds80(1), bounds80(2));
end
