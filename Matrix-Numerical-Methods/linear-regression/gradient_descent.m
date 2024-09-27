function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights
  Theta = zeros(columns(FeatureMatrix), 1);
  for k = 1:iter
    v = FeatureMatrix * Theta;
    for j = 1:n
    Error = 0;
    for i = 1:m
      Error = Error + (v(i, 1) - Y(i, 1)) * FeatureMatrix(i, j);
    endfor

    delta(j, 1) = Error;
  endfor
    Theta = Theta - alpha * delta / m;
  endfor
  Theta = [0 ; Theta];

endfunction

