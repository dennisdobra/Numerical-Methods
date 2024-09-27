function [decoded_path] = decode_path(path, lines, cols)

   for k = 1:size(path) - 1
    decoded_path(k, 1) = ceil(path(k, 1) / cols); % Calculate the row index of the decoded path.
    decoded_path(k,2) = mod(path(k, 1) - 1, cols) + 1; % Calculate the column index of the decoded path.
  endfor

endfunction

