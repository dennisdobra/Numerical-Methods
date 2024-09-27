function [Link] = get_link_matrix(Labyrinth)

  Link = get_adjacency_matrix(Labyrinth); % Get the adjacency matrix of the labyrinth
  [m, n] = size(Link);
  for i = 1:m
    contor = 0; % Initialize counter for the number of connections
    for j = 1:n
      if Link(i, j) == 1
        contor++; % Increment counter if there is a connection
      endif
    endfor
    for h = 1:n
      if Link(i, h) == 1
        Link(i, h) = 1 / contor; % Normalize the connections
      endif
    endfor
  endfor

endfunction

