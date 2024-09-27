function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  Theta(1, :) = [];
  m = length(Y);
  v = FeatureMatrix * Theta;
  Error = 0;
  for i = 1:m
    Error = Error + (v(i, 1) - Y(i, 1))^2;
  endfor
  Error = Error / (2 * m);
endfunction

