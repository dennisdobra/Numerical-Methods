function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  Theta(1, :) = []; % Remove the first element of Theta (intercept term).
  m = length(Y); % Get the number of training examples.
  v = FeatureMatrix * Theta; % Calculate predicted values.
  Error = 0; % Initialize error.
  for i = 1:m
    Error = Error + (v(i, 1) - Y(i, 1))^2; % Sum squared errors.
  endfor
  Error = Error / (2 * m); % Calculate mean squared error.

  sum = 0; % Initialize the sum for regularization term.
  for i = 1:(rows(Theta)) % Iterate through the elements of Theta.
    sum = sum + Theta(i, 1)^2; % Sum the squares of the weights.
  endfor
  Error = Error + lambda * sum; % Add regularization term to the error.
endfunction

