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
## @deftypefn {} {@var{retval} =} classifyImage (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function prediction = classifyImage (im, train_mat, train_val, pcs)
  % Initialize prediction.
  prediction = -1;

  % TODO: Cast image to double.
  im = double(im);
  % TODO: Apply the magic_with_pca function to the training dataset.
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  % TODO: Subtract the mean vector of each column from the training matrix.
  im = im - miu;
  % TODO: Change the basis by multiplying with the matrix Vk.
  im = im * Vk;
  % TODO: Calculate the prediction using the k nearest neighbor method
  % implemented earlier with k = 5.
  k = 5;
  prediction = KNN(train_val, Y, im, k);
endfunction

