function characters = segmentCharacters(img, rows)

    % Ensure binary image
    if ~islogical(img)
        img = imbinarize(img);
    end

    characters = {};
    char_count = 1;

    for i = 1:size(rows, 1)

        row_start = rows(i, 1);
        row_end   = rows(i, 2);

        row_img = img(row_start:row_end, :);

        proj = sum(row_img, 1);
        figure;
        plot(proj)

        is_text = proj > 0;
        diff_proj = diff([0 is_text 0]);

        char_starts = find(diff_proj == 1);
        char_ends   = find(diff_proj == -1) - 1;

        for j = 1:length(char_starts)

            char_img = row_img(:, char_starts(j):char_ends(j));

            rows_nonzero = any(char_img, 2);
            char_img = char_img(rows_nonzero, :);

            characters{char_count} = char_img;
            char_count = char_count + 1;
        end
    end
end