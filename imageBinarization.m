function processedImage = imageBinarization(im);
%
%PURPOSE --> Convert image into black(false or 1) and white(true or 0)
%
% ====IMPORTANT====================================================
% #The function assumes the input image has already been imported
% =================================================================
    %First, convert to black and white
    sizeIm = size(im);
    if(size(sizeIm) == [1 3])
        %If the condition is met, the image is RGB
        %We must convert it to grayscale
        im = rgb2gray(im);
    end
    %By now, the image is already in grayscale
    %Convert to purely black and white
    threshold = graythresh(im);
    %this next line is used for testing, remove when necessary
    fprintf("%f", threshold);
    processedImage = not(imbinarize(im, threshold));
    %EXPLANATION FOR THE not()
    %-----------------------------
    %For Task 2, we will be preferring to use white text over a black
    %blackground, therefore we invert the image for now.
end