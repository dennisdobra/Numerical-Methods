## Copyright (C) 2023 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} task2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28

function new_X = task2 (photo, pcs)
  [m, n] = size(photo);

  % Initialize the final matrix.
  new_X = zeros(m, n);

  % TODO: Cast photo to double.
  photo = double(photo);
  % TODO: Normalize the initial matrix by subtracting the mean of each row from it.
  for i = 1:m
    suma = 0;
    media = 0;
    for j = 1:n
      suma += photo(i, j); % Calculate the sum of each row.
    endfor
    media = suma / n;

    miu(i, 1) = media; % Calculate the column vector miu.

    photo(i, :) = photo(i, :) - media;
  endfor
  % TODO: Construct matrix Z.
  Z = zeros(n, m);
  Z = photo' / sqrt(n - 1);
  % TODO: Calculate matrices U, S, and V from SVD applied to matrix Z.
  [U, S, V] = svd(Z);
  % TODO: Construct matrix W from the first pcs columns of V.
  W = V(:, 1:pcs);
  % TODO: Calculate matrix Y.
  Y = W' * photo;
  % TODO: Approximate the initial matrix.
  new_X = W * Y + miu;
  % TODO: Convert the matrix to uint8 to make it a valid image.
  new_X = uint8(new_X);
endfunction

