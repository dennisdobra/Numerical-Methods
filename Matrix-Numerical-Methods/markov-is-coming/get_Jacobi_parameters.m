function [G, c] = get_Jacobi_parameters(Link)

  [m, n] = size(Link);
  G = Link(1:(m - 2), 1:(n - 2)); % Extract the submatrix G
  c = Link(1:(m - 2), m - 1);     % Extract the vector c

endfunction

