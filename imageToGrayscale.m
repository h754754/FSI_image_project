function imbn = imageToGrayscale(imc)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    for i= 1:(size(imc,1))
        for j = 1:(size(imc,2))
            imbn(i,j,:) = 0.3 * imc(i,j,1) + 0.59 * imc(i,j,2) + 0.11 * imc(i,j,3);
        end
    end
end