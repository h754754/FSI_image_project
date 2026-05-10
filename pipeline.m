%% TEST PIPELINE
charDB = load ("alphabetTemplatesBold.mat").tempx;
imo = imread("test.bmp");
imdb = im2double(imo);
imbw = imageBinarization(imdb);

[segmentedRows, rowLocationPairs] = rowSegmentation(imbw);

nRows = size(rowLocationPairs,1);
text = "";
for i=1:nRows
    rowText = "";
    rowPair = rowLocationPairs(i,:);
    [characters, char_starts, char_ends] = segmentCharacters(imbw, rowPair);
    for j=1:length(characters)
        
        processedChar = charPreprocessing(characters{j});
        %imshow(processedChar);
        charText = matchCharacter(processedChar,charDB);
        rowText = rowText + charText;
        if j < length(characters)
            if (char_starts(j+1) - char_ends(j)) > 6
                rowText = rowText + " ";
            end
        end
    end
    text = text + rowText + newline;
end
    
disp(text);
