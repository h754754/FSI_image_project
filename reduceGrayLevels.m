function img2 = reduceGrayLevels(img,N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %
% Funcion que reduce a N niveles de gris. %
% %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imaux = im2double(img); % Pasar a real
if (N>=256)
M = 255;
elseif (N<=2)
M = 1;
else
M = N-1;
end % El maximo de la imagen es el numero de niveles menos 1.
imaux2 = round(imaux*M);
% Imagen con N niveles de gris (enteros de 0 a M=N-1).
img2 = double(imaux2)/M; % Imagen final

%Function starts losing quality at around N = 30