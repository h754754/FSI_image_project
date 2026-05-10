%Existent sample characters are g.bmp, r.bmp, a.bmp and s.bmp
% imageBinarization works with texts with a white background and a black
% text, but these sample images have withe text in black background, hence
% the use of not()
readChar = charPreprocessing(not(imageBinarization(im2double(imread("g.bmp")))));
matchedChar = matchCharacter(readChar,charDB);
disp(["the estimated character is --->", matchedChar])

