function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  % TODO: Implement the cost_function

  % TODO1: Get Theta1 and Theta2 (from params). Hint: reshape
  s1 = input_layer_size; % Size of the input layer
  s2 = hidden_layer_size; % Size of the hidden layer
  s3 = output_layer_size; % Size of the output layer

  theta1 = zeros(s2, s1 + 1); % Initialize Theta1
  theta2 = zeros(s3, s2 + 1); % Initialize Theta2

  theta1 = reshape(params(1: s2 * (s1 + 1)), s2, s1 + 1); % Reshape params to get Theta1
  theta2 = reshape(params(s2 * (s1 + 1) + 1:end), s3, s2 + 1); % Reshape params to get Theta2

  % Forward propagation
  m = size(X, 1); % Number of training examples
  J = 0; % Initialize cost
  for i = 1:m
    a1 = X(i, :); % Select the input feature for the i-th example
    a1 = [1, a1]; % Add bias term
    z2 = theta1 * a1'; % Compute the z values for the hidden layer
    a2 = sigmoid(z2); % Compute activations for the hidden layer
    a2 = [1; a2]; % Add bias term for the hidden layer
    z3 = theta2 * a2; % Compute z values for the output layer
    a3 = sigmoid(z3); % Compute activations for the output layer

    % Compute the cost for the current example
    y_i = zeros(s3, 1); % Create a zero vector for y_i
    y_i(y(i)) = 1; % Set the correct label to 1
    J = J + sum(-y_i .* log(a3) - (1 - y_i) .* log(1 - a3)); % Accumulate cost
  endfor

  J = J / m; % Average the cost

  % Regularization
  reg_term = (lambda / (2 * m)) * (sum(sum(theta1(:, 2:end).^2)) + sum(sum(theta2(:, 2:end).^2)));
  J = J + reg_term; % Add regularization to cost

  % Backpropagation
  delta3 = a3 - y_i; % Compute the error in the output layer
  delta2 = (theta2' * delta3) .* [1; sigmoid_gradient(z2)]; % Compute the error in the hidden layer

  % Accumulate gradients
  theta1_grad = delta2(2:end) * a1; % Gradient for Theta1
  theta2_grad = delta3 * a2'; % Gradient for Theta2

  % Regularization of gradients
  theta1_grad(:, 2:end) += (lambda / m) * theta1(:, 2:end); % Regularize Theta1 gradients
  theta2_grad(:, 2:end) += (lambda / m) * theta2(:, 2:end); % Regularize Theta2 gradients

  grad = [theta1_grad(:); theta2_grad(:)]; % Unroll gradients into a single vector

  % Final J and grad
endfunction

