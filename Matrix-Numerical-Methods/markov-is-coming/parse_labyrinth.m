function [Labyrinth] = parse_labyrinth(file_path)

  in = fopen(file_path, "r"); % Open the file for reading
  m = fscanf(in, "%d", 1); % Read the number of rows (m)
  n = fscanf(in, "%d", 1); % Read the number of columns (n)

  for i = 1:m
    for j = 1:n
      Labyrinth(i,j) = fscanf(in, "%d", 1); % Read the labyrinth data into the matrix
    endfor
  endfor

  fclose(in); % Close the file
endfunction

