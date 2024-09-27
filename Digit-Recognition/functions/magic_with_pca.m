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
## @deftypefn {} {@var{retval} =} magic_with_pca (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % Initialize train
  train = zeros (m, n);

  % Initialize miu
  miu = zeros (1, n);

  % Initialize Y
  Y = zeros (m, pcs);

  % Initialize Vk
  Vk = zeros (n, pcs);

  % TODO: Cast train_mat to double.
  train_mat = double(train_mat);
  % TODO: Calculate the mean of each column of the matrix.
  miu = mean(train_mat);
  % TODO: Subtract the mean from the initial matrix.
  train_mat = train_mat - miu;
  % TODO: Calculate the covariance matrix.
  cov_matrix = cov(train_mat);
  % TODO: Calculate the eigenvectors and eigenvalues of the covariance matrix.
  % HINT: Use the eig function
  [V, D] = eig(cov_matrix);
  % TODO: Sort the eigenvalues in descending order and create a matrix V
  % formatted with the eigenvectors arranged in columns, such that the first column
  % is the eigenvector corresponding to the largest eigenvalue, and so on.
  [~, indices] = sort(diag(D), 'descend');
  Vk = V(:, indices);
  % TODO: Keep only the first pcs columns from the previously obtained matrix.
  Vk = Vk(:, 1:pcs);
  % TODO: Create matrix Y by changing the basis of the initial matrix.
  Y = train_mat * Vk;
  % TODO: Calculate the train matrix, which is an approximation of the initial matrix
  % using the Vk matrix calculated earlier.
  train = Y * Vk';
endfunction

