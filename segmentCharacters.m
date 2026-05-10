function [characters, char_starts, char_ends] = segmentCharacters(img, rows)

    % Ensure binary image
    if ~islogical(img)
        img = imbinarize(img);
    end


    char_count = 1;
    
    for i = 1:size(rows, 1)

        row_start = rows(i, 1);
        row_end   = rows(i, 2);

        row_img = img(row_start:row_end, :);
        %figure();imshow(row_img);
        proj = sum(row_img, 1);
        %figure;
        %plot(proj)

        is_text = proj > 0;
        % calculation of the start and end markers of a character
        diff_proj = diff([0 is_text 0]);
        char_starts = find(diff_proj == 1);
        char_ends   = find(diff_proj == -1) - 1;
        
        % consider a margin of error of 10 characters,i.e., there might be
        % 10 characters that are not counted because they appear jointly
        % with another one
        char_length = length(char_starts) + 10;
        characters = cell(char_length,1);

        % remove vertical borders
        % 5 was chosen so that it is high enough to discard borders but 
        % low enough to allow the thinnest character, the I
        mask = (char_ends - char_starts) >=1;
        char_starts = char_starts(mask);
        char_ends = char_ends(mask);
        j = 1;
        while j <= length(char_starts)
            % after all the reading, now char_starts has the true
            % length,i.e., considering the previously considered joint
            % characters
            char_img = row_img(:, char_starts(j):char_ends(j));
            %figure();imshow(char_img);
            rows_nonzero = any(char_img, 2);
            char_img = char_img(rows_nonzero, :);
            %imshow(char_img); %only for debugging purposes
            if (size(char_img,2)/size(char_img,1)) < 1.5
                characters{char_count} = char_img;
                char_count = char_count + 1;
            else
                % if the above condiction is not met, we are dealing with 
                % liaison
                wide_proj = sum(char_img, 1);
                [~, split_col] = min(wide_proj);

                % Determine where the characters are joined
                % and split them in that point
                % Make sure it is not the beggining
                if split_col == 1
                    split_col = 2;
                elseif split_col == size(char_img,2)
                    split_col = size(char_img,2) - 1;
                end
                % save the characters in a different cell
                left_img = char_img(:, 1:split_col);
                right_img = char_img(:, split_col+1:end);

                characters{char_count} = left_img;
                split_position = char_starts(j) + split_col;
                % insert the splitted start after the "joint" start
                char_starts = [char_starts(1:j),split_position,char_starts(j + 1:end)];
                
                char_count = char_count + 1;
                % insert the splitted end before the "join" end
                char_ends = [char_ends(1:j-1),split_position,char_ends(j:end)];
                characters{char_count} = right_img;
                char_count = char_count + 1;
                % we have incresed in 1 the number of characters, so we
                % have to do the same with the iteration variable j
                j = j+1;
            end
            j = j+1;
        end
        % finally, we trim out the empty cells
        characters = characters(1:length(char_starts));
end