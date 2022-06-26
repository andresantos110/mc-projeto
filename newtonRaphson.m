% Newton method for calculating zeros of nonlinear functions
% F - function such that F(X) = 0
% FLINHA - derivative of F
% X0 - initial value
% EPS - maximum allowed value for | X_{k+1} - X_k |
% ITER_MAX - maximum number of iterations.
% [ROOT, FZ, I, Z, DIF] = NEWTONRAPHSON(F, ...) returns
% ROOT - approximate value of the zero of the function F
% FZ - function F evaluated at the ROOT
% I - number of iterations
% Z - all calculated iterations
% DIF - absolute difference between successive iterations
%
% Example:
%   [root, fz, i, z, dif]  = newtonRaphson(@(x) 2-x-exp(-x), @(x) -1+exp(-x), 2, 1e-2, 100)
%   returns
%   root = 1.841406066157926
%   fz = -1.747686199673332e-03
%   i = 2
%   z = 2.000000000000000  1.843482357250334  1.841406066157926
%   dif = 1.565176427496657e-01  2.076291092407841e-03
function [root, fz, i, z, dif] = newtonRaphson(f, flinha, x0, eps, iter_max)
   if nargin < 5 iter_max = 1e3; end
   if nargin < 4 eps = 1e-6; end
   z(1) = x0;
   dif = [];
   for i = 1:iter_max
      fz = feval(f, z(i));
      fzlinha = feval(flinha, z(i));
      if abs(fzlinha) == 0 % f'(x0) equal zero 
         disp('Derivative value in Xi can not be zero');
	     root = z(length(z));
         i = i - 1;
         return
      end
      d = fz / fzlinha;
      z(i+1) = z(i) - d;
      dif(i) = abs(d);
      if dif(i) < eps
	     root = z(length(z));
         return
      end
   end   
   fprintf('Maximum number of iterations %d is exceeded\n ', iter_max); 
   root = z(length(z));
