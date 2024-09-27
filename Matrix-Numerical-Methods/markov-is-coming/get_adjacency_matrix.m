function [Adj] = get_adjacency_matrix(Labyrinth)

  [m, n] = size(Labyrinth);

  Adj = zeros(m * n + 2, m * n + 2); % Adjacency matrix
  sparse(Adj); % Initialize the adjacency matrix
  contor = 0;

  for i = 1:m
    for j = 1:n
      contor++;
      if j == 1 % First column
        if i == 1 % Top-left corner
          if rem(Labyrinth(1, 1), 2) == 0 % Check for wall to the South
            Adj(1, m * n + 2) = 1;
          endif
          if rem(Labyrinth(1, 1), 4) < 2 % Check for wall to the East
            Adj(1, 2) = 1;
          endif
          if rem(Labyrinth(1, 1), 8) < 4 % Check for wall to the South
            Adj(1, 1 + n) = 1;
          endif
          if rem(Labyrinth(1, 1), 16) < 8 % Check for wall to the North
            Adj(1, m * n + 1) = 1;
          endif

        elseif i == m % Bottom-left corner
          if rem(Labyrinth(m, 1), 2) == 0
            Adj(contor, m * n + 2) = 1;
          endif
          if rem(Labyrinth(m, 1), 4) < 2
            Adj(contor, contor + 1) = 1;
          endif
          if rem(Labyrinth(m, 1), 8) < 4
            Adj(contor, m * n + 1) = 1;
          endif
          if rem(Labyrinth(m, 1), 16) < 8
            Adj(contor, contor - n) = 1;
          endif

        else % First column, between the first and last row
          if rem(Labyrinth(i, 1), 2) == 0 % Check for wall to the South
            Adj(contor, m * n + 2) = 1;
          endif
          if rem(Labyrinth(i, 1), 4) < 2 % Check for wall to the East
            Adj(contor, contor + 1) = 1;
          endif
          if rem(Labyrinth(i, 1), 8) < 4 % Check for wall to the South
            Adj(contor, contor + n) = 1;
          endif
          if rem(Labyrinth(i, 1), 16) < 8 % Check for wall to the North
            Adj(contor, contor - n) = 1;
          endif
        endif

      elseif j == n % Last column
        if i == 1 % Top-right corner
          if rem(Labyrinth(1, n), 2) == 0 % Check for wall to the South
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(1, n), 4) < 2 % Check for wall to the East
            Adj(contor, m * n + 2) = 1;
          endif
          if rem(Labyrinth(1, n), 8) < 4 % Check for wall to the South
            Adj(contor, contor + n) = 1;
          endif
          if rem(Labyrinth(1, n), 16) < 8 % Check for wall to the North
            Adj(contor, m * n + 1) = 1;
          endif

        elseif i == m % Bottom-right corner
          if rem(Labyrinth(m, n), 2) == 0 % Check for wall to the South
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(m, n), 4) < 2 % Check for wall to the East
            Adj(contor, m * n + 2) = 1;
          endif
          if rem(Labyrinth(m, n), 8) < 4 % Check for wall to the South
            Adj(contor, m * n + 1) = 1;
          endif
          if rem(Labyrinth(m, n), 16) < 8 % Check for wall to the North
            Adj(contor, contor - n) = 1;
          endif

        else % Last column, between the first and last row
          if rem(Labyrinth(i, n), 2) == 0
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(i, n), 4) < 2
            Adj(contor, m * n + 2) = 1;
          endif
          if rem(Labyrinth(i, n), 8) < 4
            Adj(contor, contor + n) = 1;
          endif
          if rem(Labyrinth(i, n), 16) < 8
            Adj(contor, contor - n) = 1;
          endif
        endif

      else % Between the first and last column
        if i == 1 % First row, between the first and last column
          if rem(Labyrinth(1, j), 2) == 0 % Check for wall to the South
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(1, j), 4) < 2 % Check for wall to the East
            Adj(contor, contor + 1) = 1;
          endif
          if rem(Labyrinth(1, j), 8) < 4 % Check for wall to the South
            Adj(contor, contor + n) = 1;
          endif
          if rem(Labyrinth(1, j), 16) < 8 % Check for wall to the North
            Adj(contor, m * n + 1) = 1;
          endif

        elseif i == m % Last row, between the first and last column
          if rem(Labyrinth(m, j), 2) == 0 % Check for wall to the South
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(m, j), 4) < 2 % Check for wall to the East
            Adj(contor, contor + 1) = 1;
          endif
          if rem(Labyrinth(m, j), 8) < 4 % Check for wall to the South
            Adj(contor, m * n + 1) = 1;
          endif
          if rem(Labyrinth(m, j), 16) < 8 % Check for wall to the North
            Adj(contor, contor - n) = 1;
          endif

        else % It is in the middle of the matrix, not on the edge
          if rem(Labyrinth(i, j), 2) == 0 % Check for wall to the South
            Adj(contor, contor - 1) = 1;
          endif
          if rem(Labyrinth(i, j), 4) < 2 % Check for wall to the East
            Adj(contor, contor + 1) = 1;
          endif
          if rem(Labyrinth(i, j), 8) < 4 % Check for wall to the South
            Adj(contor, contor + n) = 1;
          endif
          if rem(Labyrinth(i, j), 16) < 8 % Check for wall to the North
            Adj(contor, contor - n) = 1;
          endif
        endif

      endif

    endfor
  endfor
  Adj(m * n + 1, m * n + 1) = 1; % Add self-loop for the start node
  Adj(m * n + 2, m * n + 2) = 1; % Add self-loop for the end node

endfunction

