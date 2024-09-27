function [Y, InitialMatrix] = parse_csv_file(file_path)

  InitialMatrix = cell();

  in = fopen(file_path, "r");
  line = fscanf(in, "%s", 1); % Read the header
  line = fscanf(in, "%s", 1); % Read the first valid line

  i = 1;
  while ~feof(in) % While reading the file
    j = 1;
    [token, rem] = strtok(line, ',');
    while isempty(token) == 0
      InitialMatrix(i, j) = token;
      j++;
      [token, rem] = strtok(rem, ',');
    endwhile
    line = fscanf(in, "%s", 1);
    i++;
  endwhile
  j = 1;
  [token, rem] = strtok(line, ',');
  while isempty(token) == 0
    InitialMatrix(i, j) = token;
    j++;
    [token, rem] = strtok(rem, ',');
  endwhile
  for i = 1:rows(InitialMatrix)
    Y(i, 1) = str2num(InitialMatrix{i, 1});
  endfor
  InitialMatrix = InitialMatrix(1:rows(InitialMatrix), 2:columns(InitialMatrix));
endfunction

