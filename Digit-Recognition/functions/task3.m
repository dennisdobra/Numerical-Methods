## Copyright (C) 2021 Andrei
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
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % Initialize the final matrix.
  new_X = zeros (m, n);

  % TODO: Cast photo to double.
  photo = double(photo);
  % TODO: Calculate the mean of each row of the matrix.
  % TODO: Normalize the initial matrix by subtracting the mean of each row.
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
  % TODO: Calculate the covariance matrix.
  Z = photo * photo' / (n - 1);
  % TODO: Calculate the eigenvectors and eigenvalues of the covariance matrix.
  % HINT: Use the eig function.
  [V, S] = eig(Z);
  % TODO: Sort the eigenvalues in descending order and create a matrix V
  % consisting of the eigenvectors arranged in columns, so that the first column
  % is the eigenvector corresponding to the largest eigenvalue and so on.
  [eigenvalues_sorted, indices] = sort(diag(S), 'descend');
  V_sorted = V(:, indices);
  % TODO: Keep only the first pcs columns.
  % NOTE: The first columns of V represent the principal components, and
  % by keeping only the most important ones we achieve good data compression.
  % As we increase the number of principal components, the clarity
  % of the image increases, but after a certain number, the difference
  % may not be noticeable to the human eye, so they can be eliminated.
  W = V_sorted(:, 1:pcs);
  % TODO: Create matrix Y by changing the basis of the initial matrix.
  Y = W' * photo;
  % TODO: Calculate the new_X matrix, which is an approximation of the initial matrix.
  new_X = W * Y;
  % TODO: Add back the previously subtracted row means.
  new_X = new_X + miu;
  % TODO: Convert the matrix to uint8 to make it a valid image.
  new_X = uint8(new_X);
endfunction

