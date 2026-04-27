function [estimatedChar] = matchCharacter(readChar)
% Finds the character in the database
%   Args:
%       - readChar     : character extracted from segmentCharacters.m
%   Returns:
%       - estimatedChar: estimated character based on charCompare.m

    % INITIAL IMPLEMENTATION BEFORE DATABASE WAS CREATED

    % The lines with a $ after them will be replaced/removed after the
    % database is created

    charList = ["r" "s" "a" "g"];% $
    charListSize = size(charList);% $
    nchars = charListSize(2);% $

    % since the characters are 32x32, the maximum difference 
    % we can have is 32x32, which would be between a full 
    % black and a full white char
    lowestMetric = 32 * 32;
    estimatedChar = "";
    
    for i=1:nchars
        dbCharName = charList(i);

        % THIS PROCESSING WILL HAVE ALREADY BEEN DONE AFTER TASK 5
        % (DATABASE CREATION)
        
        dbChar = tempCharProcess(dbCharName + '.bmp');% $
        % NOTE that readChar is supposed to have already passed this
        % processing

        thismetric = charCompare(readChar,dbChar);

        if thismetric < lowestMetric
            lowestMetric = thismetric;
            estimatedChar = dbCharName;
        end
    end
end