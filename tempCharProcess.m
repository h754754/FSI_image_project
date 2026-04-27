function [processedChar] = tempCharProcess(charbmp)
% Process character to get for database/comparison purposes
%   Args:
%       charbmp      : bmp filename of the character (before processing)
%   Returns:
%       processedChar: character for later processes

    % INITIAL IMPLEMENTATION BEFORE DATABASE WAS CREATED

    % The lines with a $ after them will be replaced/removed after the
    % database is created

    processedChar = imread(charbmp);% $
    processedChar = im2double(processedChar);% $
    processedChar = im2gray(processedChar);% $
    processedChar = imresize(processedChar,[32 32]);% $
end