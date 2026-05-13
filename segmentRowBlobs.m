function [blobBoundingBox,rowLocationPairs] = segmentRowBlobs(im)
%   Args:
%       - im : Image containing the text
%   Returns:
%       - blobBoundingBox : bounding box for each row
%       - rowLocationPairs: vertical position of the rows in the image

% first, we convert each row into a white blob with mathematical morphology
% set the length to an arbitrary value that should be larger than the
% spacing between words in the same row
lineBlob = strel('line',20,0);
% use dilation (get the maximum value within the line and assign it to all
% the neighbourhood
rowBlobs = imdilate(im,lineBlob);

% for debugging purposes only
%imshow(rowBlobs);

blobBoundingBox = regionprops(rowBlobs,"BoundingBox");
% BoundingBox returns [x,y,width,height]
% (es.mathworks.com/help/images/ref/regionprops.html)
% we are interesed in the y and width values

% set a safety margin for the row positions
margin = 2;
% arrayfun allows us to MAP a list (like in functional programming in high
% level programming languages like javascript)
rowStarts = arrayfun(@(rowblob) rowblob.BoundingBox(2),blobBoundingBox) - margin;
rowEnds = rowStarts + arrayfun(@(rowblob) rowblob.BoundingBox(4),blobBoundingBox) + margin;

rowLocationPairs = round([rowStarts rowEnds]);
end