% Baseado no codigo da função newtonRaphson
% Entradas:
% f - função que queremos estimar o zero
% x0 - valor inicial
% TolX - precisão minima exigida
% MaxIter - numero maximo de iteradas a realizar
% Saidas:
% z - aproximação da raiz de f
% fz - falor de f na raiz z
% iter - vector contendo as iteradas
function [z, fz, iter] = newtonquasi(f, x0, TolX, MaxIter)
   if nargin < 4 MaxIter = 1e3; end
   if nargin < 3 TolX = 1e-6; end
   iter(1) = x0;
   delta = 1e-5;
   for i = 1:MaxIter
      fz = feval(f, iter(i));
      fd = feval(f, iter(i) + delta);
      fdel = (fd - fz);
      d = (delta*fz) / fdel;
      iter(i+1) = iter(i) - d;
      dif(i) = abs(iter(i+1)-iter(i))/abs(iter(i+1));
      if dif(i) < TolX
	     z = iter(length(iter));
         return
      end
   end   
   fprintf('Maximum number of iterations %d is exceeded\n ', MaxIter); 
   z = iter(length(iter));