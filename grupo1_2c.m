% rotina para calcular o numero de iteradas com diferentes deltas em newtonquasi (alterados dentro da função)

[root,fc,k,c,e]=bissecao(@(x) exp(-2*x)*(2*sin(4*x)+cos(4*x))-0.001,0.5,1,1e-15,1e-15,100);
[z,fz,iter] = newtonquasi(@(x) exp(-2*x)*(2*sin(4*x)+cos(4*x))-0.001, 0.5, 1e-5, 100);

niter=numel(iter)-1
err=abs(root-z)