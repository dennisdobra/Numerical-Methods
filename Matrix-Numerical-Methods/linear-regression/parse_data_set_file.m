function [Y, InitialMatrix] = parse_data_set_file(file_path)

  in = fopen(file_path, "r"); % Open the specified file in read mode.
  m = fscanf(in, "%d", 1); % Read the number of rows (m).
  n = fscanf(in, "%d", 1); % Read the number of columns (n).
  InitialMatrix = cell(m, n); % Initialize a cell array with m rows and n columns.

  for i = 1:m
    Y(i, 1) = fscanf(in, "%d", 1); % Read the first value of each row into Y.
    for j = 1:n
      InitialMatrix(i, j) = fscanf(in, "%s", 1); % Read each subsequent value into InitialMatrix.
    endfor
  endfor
  fclose(in); % Close the file after reading.
endfunction

