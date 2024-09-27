function [path] = heuristic_greedy(start_position, probabilities, Adj)

  path(1, 1) = start_position; % Initialize the path with the starting position
  k = 1;
  visited(k) = start_position; % Add the starting position to visited

  while isempty(path) != 1
    probability = 0;
    ok = 0;

    for i = 1:columns(Adj)

      if Adj(path(end), i) == 1 % Check if neighbor i exists

        if ismember(i, visited) == 0 % Check if it's not visited
          ok = 1;
          if (probabilities(i) > probability)
            probability = probabilities(i); % Update probability
            neigh = i; % Set neighbor to the one with the highest probability
          endif
        endif

      endif
    endfor

    if ok == 1
      % Add neighbor to path and visited
      visited(end + 1) = neigh;
      path(end + 1) = neigh;

      if probabilities(neigh) == 1
        break; % Stop if the probability of the neighbor is 1
      endif
    else
      path(end) = []; % Remove last position from path if no new neighbor found
    endif

  endwhile

  path = path'; % Convert row vector to column vector

endfunction

