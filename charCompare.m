function [metric] = charCompare(readChar,dbChar)
% Function to compare a read character with one stored in the database
%   Args:
%       - readChar : character extracted from segmentCharacters.m
%       - dbChar   : character from the database
%   Returns:
%       - metric   : indicative of similarity between readChar and dbChar
    
    % Computes the difference between two images
    % Extracted from: https://www.mathworks.com/help/images/ref/imabsdiff.html
    
    % DEPRECATED
    %diff_image = imabsdiff(readChar,dbChar);
    %diff_matrix = im2double(diff_image);
    
    
    % for debugging purposes only
    % imshow(diff_matrix);
    % the metric is simply the addition of all the differences
    % similar images have more coincidences, therefore the value of the
    % difference is smaller
    % Therefore, the criteria to follow would be to take the character with
    % the lowest metric as a match
    
    % ssim computes the structural image similarity
    metric = ssim(readChar,dbChar);
    metric = corr2(readChar,dbChar);
end