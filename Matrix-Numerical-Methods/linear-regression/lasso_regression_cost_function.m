function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
  Theta(1, :) = [];
  m = length(Y);
  v = FeatureMatrix * Theta;
  Error = 0;
  for i = 1:m
    Error = Error + (Y(i, 1) - v(i, 1))^2;
  endfor
  Error = Error / m;

  sum = 0;
  for i = 1:(rows(Theta));
    sum = sum + abs(Theta(i, 1));
  endfor
  Error = Error + lambda * sum;

endfunction

