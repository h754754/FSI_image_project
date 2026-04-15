function [segmentedRows, rowLocationPairs] = rowSegmentation(im)
%   Function that gets the sum of all the pixels in a row
%   Its purpose is to detect the rows
    segmentedRows = sum(im, 2); %Returns a vector that contains the sum of each row
    plot(segmentedRows);

    %For now, we will use the mean as threshold to determine whether a row
    %is relevant or not
    threshold = mean(segmentedRows);
    segmentedRows = (segmentedRows > threshold);
    figure; plot(segmentedRows);

    %Find start-end pairs

    %compute where the function transitions from 0 to 1 and viceversa
    transitions = diff([0;segmentedRows;0]);
    %diff returns 1 in a transition from 0 to 1
    %            -1 in a transition from 1 to 0
    %             0 if  x(i+1) - x(i) = 0
    startRow = find(transitions == 1);
    endRow = find(transitions == -1) -1; %we substract 1 because diff marks the first zero after the segment
    rowLocationPairs = [startRow endRow];

end