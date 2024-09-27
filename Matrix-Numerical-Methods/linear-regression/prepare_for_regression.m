function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  [m, n] = size(InitialMatrix); % Get the number of rows (m) and columns (n) in InitialMatrix.
  for i = 1:m
    h = 1; % Initialize the column index for FeatureMatrix.
    for j = 1:n
      if strcmp(InitialMatrix{i, j}, 'yes') == 1
        FeatureMatrix(i, h) = 1; % Set FeatureMatrix value to 1 for 'yes'.
      elseif strcmp(InitialMatrix{i, j}, 'no') == 1
        FeatureMatrix(i, h) = 0; % Set FeatureMatrix value to 0 for 'no'.
      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished') == 1
        if j == n % Check if it's the last column, no need to swap.
          FeatureMatrix(i, h) = 1; % Set FeatureMatrix value for semi-furnished.
          FeatureMatrix(i, h + 1) = 0; % Set the next column to 0.
        endif
        if j < n % Need to swap columns.
          FeatureMatrix(i, h) = 1; % Set FeatureMatrix value for semi-furnished.
          FeatureMatrix(i, h + 1) = 0; % Set the next column to 0.
          h++; % Move to the next column index.
        endif
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished') == 1
        if j == n % No need to swap anything.
          FeatureMatrix(i, h) = 0; % Set FeatureMatrix value for unfurnished.
          FeatureMatrix(i, h + 1) = 1; % Set the next column to 1.
        endif
        if j < n % Need to swap.
          FeatureMatrix(i, h) = 0; % Set FeatureMatrix value for unfurnished.
          FeatureMatrix(i, h + 1) = 1; % Set the next column to 1.
          h++; % Move to the next column index.
        endif
      elseif strcmp(InitialMatrix{i, j}, 'furnished') == 1
        if j == n % No need to swap anything.
          FeatureMatrix(i, h) = 0; % Set FeatureMatrix value for furnished.
          FeatureMatrix(i, h + 1) = 0; % Set the next column to 0.
        endif
        if j < n % Need to swap.
          FeatureMatrix(i, h) = 0; % Set FeatureMatrix value for furnished.
          FeatureMatrix(i, h + 1) = 0; % Set the next column to 0.
          h++; % Move to the next column index.
        endif
      else
        FeatureMatrix(i, h) = str2double(InitialMatrix{i, j}); % Convert numeric values to double.
      endif
      h++; % Increment the column index.
    endfor
  endfor
endfunction

