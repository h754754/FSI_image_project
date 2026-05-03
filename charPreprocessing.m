function charPreprocessed = charPreprocessing(imbw)
%CHARPREPROCESSING Summary of this function goes here
%   Receives a segmented character image and 
%   converts it to an square image 32x32
    
    %First, we check the size of the image
    %as well as how many rows/columns we are missing

    [rows,cols,~] = size(imbw);
    if rows>32 || cols>32
        scale = min(32/rows, 32/cols);
        imbw = imresize(imbw, scale);
        [rows,cols,~] = size(imbw);
    end
    remainingRows = 32 - rows;
    remainingCols = 32 - cols;

    upperRows = ceil(remainingRows/2); %Rows to add above
    lowerRows = floor(remainingRows/2); %Rows to add below,
                                        %if the number is odd, we place the
                                        %least amount of rows below the
                                        %character

    rightCols = ceil(remainingCols/2); %Columns to add to the right
    leftCols = floor(remainingCols/2); %Columns to add to the left
                                       %Same logis as for the rows
    %We create the canvas for our final image
    canvas = zeros(32);

    %Place the original image on our canvas
    canvas(upperRows+1:upperRows+rows, leftCols+1:leftCols+cols) = imbw;

    charPreprocessed = canvas;
end