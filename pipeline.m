%% TEST PIPELINE
charDB = load ("charDB_remastered.mat").db;

% INSERT AS THE ARGUMENT TO IMREAD THE FILENAME OF THE TEXT IMAGE
imo = imread("test.bmp");
imdb = im2double(imo);



% IMAGE BINARIZATION (Task 1)
imbw = imageBinarization(imdb);

% ROW SEGMENTATION (Task 2)
[segmentedRows, rowLocationPairs] = rowSegmentation(imbw);
% ROW SEGMENTATION (Task 2 ADVANCED)
%[blobBoundingBox,rowLocationPairs] = segmentRowBlobs(imbw);

nRows = size(rowLocationPairs,1);
% DEBUGGING/TESTING DATA
times = zeros(nRows,1);
rowLength = zeros(nRows,1);

text = "";
for i=1:nRows
    tic
    rowText = "";
    rowPair = rowLocationPairs(i,:);
    % CHARACTER SEGMENTATION (Task 3)
    [characters, char_starts, char_ends] = segmentCharacters(imbw, rowPair);
    for j=1:length(characters)
        % CHARACTER PREPROCESSING (Task 4)
        processedChar = charPreprocessing(characters{j});
        %imshow(processedChar);
        % CHARACTER RECOGNITION (Task 6)
        charText = matchCharacter(processedChar,charDB);
        rowText = rowText + charText;
        if j < length(characters)
            if (char_starts(j+1) - char_ends(j)) > 6
                rowText = rowText + " ";
            end
        end
    end
    text = text + rowText + newline;
    t = toc;
    times(i) = t;
    rowLength(i) = length(characters);
    % debugging information
    fprintf('\nline %i containing %i characters took %f seconds to process',i,length(characters),t);
    
end
% print the result
fprintf("\n%s",text)
fprintf("\n RESULT REPORT:\n average time per character --> %f",mean(times./rowLength))

