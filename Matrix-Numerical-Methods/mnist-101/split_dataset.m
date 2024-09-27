function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset

  % Ensure the percent is between 0 and 1
  if percent <= 0 || percent >= 1
      error('Percent must be between 0 and 1.');
  end

  n = size(X, 1); % Number of examples
  p = randperm(n); % Random permutation of indices

  % Shuffle X and y based on the random permutation
  X = X(p, :);
  y = y(p, :);

  % Calculate the number of training examples
  val = floor(percent * n);

  % Split the dataset
  X_train = X(1:val, :);
  y_train = y(1:val, :);
  X_test = X(val + 1:end, :);
  y_test = y(val + 1:end, :);
end

