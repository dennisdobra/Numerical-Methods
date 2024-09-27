function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
  %s1 = input_layer_size
  %s2 = hidden_layer_size
  %s3 = output_layer_size
  
  % TODO: predict_classes implementation
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  
  theta1 = zeros(s2, s1 + 1);
  theta2 = zeros(s3, s2 + 1);
  
  
    
endfunction
