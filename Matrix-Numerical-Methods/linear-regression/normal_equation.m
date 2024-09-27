function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  x_0 = zeros(columns(FeatureMatrix), 1);

  eig_vals = eig(A);
  if A == A' && all(eig_vals > 0)
    r = b - A * x_0;
    v = r;
    Theta = x_0;
    tol = tol * tol;
    k = 1;
    while k <= iter && r' * r > tol
     t = (r' * r) / (v' * A * v);
     Theta = Theta + t * v;
     r_prev = r;
     r = r - t * A * v;
     s = (r' * r) / (r_prev' * r_prev);
     v = r + s * v;
     k = k + 1;
    endwhile
    Theta = [0; Theta];
  else
    Theta = zeros(columns(FeatureMatrix) + 1, 1);
  endif
endfunction

