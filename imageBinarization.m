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
        im = ImagenGrises(im);
    end
    %By now, the image is already in grayscale
    %Convert to purely black and white
    im = ReduceGrises(im, 1);

    processedImage = im;
end