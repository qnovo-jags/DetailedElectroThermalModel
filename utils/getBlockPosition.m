function pos = getBlockPosition(blockNum)
%GETBLOCKPOSITION Returns [x1 y1 x2 y2] for a given block in 4x4x2 layout
%
% Blocks numbered vertically down columns:
% Left side (1-16): columns left to right, rows bottom to top (1 at bottom-left)
% Right side (17-32): columns right to left, rows bottom to top

    % --- Layout parameters ---
    rows = 4;
    cols = 4;
    blocksPerLayer = rows * cols;

    blockW = 50;
    blockH = 40;

    hSpacing = 100;
    vSpacing = 150;
    layerSpacing = 450;

    x0 = 100;
    y0 = 100;

    % Determine layer (0 for left, 1 for right)
    layer = floor((blockNum - 1) / blocksPerLayer);
    posInLayer = mod(blockNum - 1, blocksPerLayer);

    % Row is modulo rows (0-based, bottom to top)
    row = rows - floor(posInLayer / rows);

    % Column is integer division by rows
    col = mod(posInLayer, rows);

    if(layer==1)
        row = rows - row + 1;
        col = cols - col;
    end
    % Calculate coordinates
    x1 = x0 + col * hSpacing + layer * layerSpacing;
    y1 = y0 + row * vSpacing;
    x2 = x1 + blockW;
    y2 = y1 + blockH;

    pos = [x1, y1, x2, y2];
end


