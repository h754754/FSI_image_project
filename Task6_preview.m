
% Existent sample characters are g.bmp, r.bmp, a.bmp and s.bmp
readChar = tempCharProcess("g.bmp");
matchedChar = matchCharacter(readChar);
disp(["the estimated character is --->", matchedChar])