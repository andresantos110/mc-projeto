% BISSECCAO search for roots of single-variable equations F(x) = 0 
% using Bisection method
% F - function such that F(Z) = 0 with Z in the interval [A,B]
% EPS_ABS - maximum allowed value for | FUN (Z) |; | FUN (Z) | < EPS_ABS
% EPS_STEP - maximum error allowed.
% ITER_MAX - maximum number of iterations.
% [ROOT FZ NITER ITER ERROR] = BISSECAO(FUN, ...) returns
% ROOT - approximate value of the zero of the function
% FZ - function value at the root
% NITER - number of iterations
% ITER - all calculated iterations
% ERROR - error for each iteration
%
% Examples
%   z = bissecao(@cos, 1,3) returns
%   z = 1.570796966552734e+000
%
%   [root fz niter iter erro] = bissecao(@(x) 2-x-exp(-x), 0, 2, 1e-2, 1e-2, 100)
%   returns
%   root =   1.84375000000000e+000
%   fz =  -1.97297604949839e-003
%   niter =   6.00000000000000e+000
%   iter = 1.00000000000000e+000
%          1.50000000000000e+000
%          1.75000000000000e+000
%          1.87500000000000e+000
%          1.81250000000000e+000
%          1.84375000000000e+000
%   erro = 1.00000000000000e+000
%          2.50000000000000e-001
%          6.25000000000000e-002
%          1.56250000000000e-002
%          3.90625000000000e-003
%          9.76562500000000e-004
function [root, fc, k, c, e] = bissecao(f, a, b, eps_abs, eps_step, iter_max)
   if nargin < 6 iter_max = 1e3; end
   if nargin < 5 eps_step = 1e-6; end
   if nargin < 4 eps_abs = 1e-6; end
   root = [];
   k = 0;
   c = a;
   e = b - a;
   fa = feval(f, a);
   fc = fa;
   fb = feval(f, b);
   if ( fa * fb < 0 )
      while abs(b - a) >= eps_step 
         k = k + 1;
         if k > iter_max
            disp('root not found with the desired accuracy')
            fprintf('Maximum number of iterations exceeded: %d\n', k)
            return
         end
         c(k) = (a + b)/2;
         e(k) = (b - a)/2;
         fc = feval(f, c(k));
         if abs(fc) < eps_abs
            break;
         elseif fa * fc < 0 
            b = c(k);
            fb = fc;
         else
            a = c(k);
            fa = fc;
         end
      end
   else
      disp('The function must have opposite signs at the extreme points');
   end
   root = c(length(c));
