function templates = buildTemplates(templateImagePath, labels)
%BUILDTEMPLATES  Creates a template dictionary from any template image.
%
% templateImagePath : path to the image containing characters
% labels            : array of labels (e.g., 'A':'Z', '0':'9', etc.)
%
% RETURNS:
%   templates       : containers.Map where each key is a label and
%                     each value is a 32x32 processed character image.

    % -----------------------------
    % Load and binarize (Task 1)
    % -----------------------------
    im = imread(templateImagePath);
    im = im2double(im);
    bw = imageBinarization(im);

    % -----------------------------
    % Segment rows (Task 2)
    % -----------------------------
    [~, rowPairs] = rowSegmentation(bw);

    % -----------------------------
    % Segment characters (Task 3)
    % -----------------------------
    chars = segmentCharacters(bw, rowPairs);

    % -----------------------------
    % Preprocess and store (Task 4)
    % -----------------------------
    templates = containers.Map;

    if length(chars) ~= length(labels)
        error("Number of segmented characters (%d) does not match number of labels (%d).", ...
              length(chars), length(labels));
    end

    for i = 1:length(chars)
        charImg = chars{i};
        charNorm = charPreprocessing(charImg);   % your Task 4 function
        templates(labels(i)) = charNorm;
    end
end
