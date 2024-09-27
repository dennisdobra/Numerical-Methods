function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

  n = length(c); % Get the number of elements in c
  x = x0; % Initialize x with the initial guess x0
  err = 1; % Initialize error to a value greater than tolerance
  steps = 0; % Initialize the number of steps

  while (err > tol) && (steps < max_steps) % Continue until error is within tolerance or max steps is reached
    x = G * x0 + c; % Update x using the iteration formula
    err = norm(x - x0); % Calculate the error
    steps = steps + 1; % Increment the step counter
    x0 = x; % Update x0 for the next iteration
  endwhile

endfunction

