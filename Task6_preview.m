%Existent sample characters are g.bmp, r.bmp, a.bmp and s.bmp
readChar = charPreprocessing(not(imageBinarization(im2double(imread("g.bmp")))));
matchedChar = matchCharacter(readChar,tempx);
disp(["the estimated character is --->", matchedChar])

