function [estimatedChar] = matchCharacter(readChar,chardb)
% Finds the character in the database
%   Args:
%       - readChar     : character extracted from segmentCharacters.m
%       - chardb       : character database (Map char -> image) 
%   Returns:
%       - estimatedChar: estimated character based on charCompare.m

    % INITIAL IMPLEMENTATION BEFORE DATABASE WAS CREATED

    % The lines with a $ after them will be replaced/removed after the
    % database is created

    nchars = length(chardb);% $

    % since the characters are 32x32, the maximum difference 
    % we can have is 32x32, which would be between a full 
    % black and a full white char
    highestMetric = -1;
    estimatedChar = "";
    
    for i=chardb.keys()
        dbCharName = i{1};
        dbCharImage = chardb(dbCharName);
        % THIS PROCESSING WILL HAVE ALREADY BEEN DONE AFTER TASK 5
        % (DATABASE CREATION)
        

        % NOTE that readChar is supposed to have already passed this
        % processing

        thismetric = charCompare(removeEmpty(readChar),removeEmpty(dbCharImage));

        if thismetric > highestMetric
            highestMetric = thismetric;
            estimatedChar = dbCharName;
        end
    end
end