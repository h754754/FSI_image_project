function [final] = removeEmpty(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    temp = x(any(x, 2), :);
    final = temp(:, any(temp, 1));
    final = imresize(final,[32,32]);
end