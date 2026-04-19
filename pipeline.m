%% TEST PIPELINE

imo = imread("test.bmp");
imdb = im2double(imo);
imbw = imageBinarization(imdb);

[segmentedRows, rowLocationPairs] = rowSegmentation(imbw);

characters = segmentCharacters(imbw, rowLocationPairs);
l = length(characters);
