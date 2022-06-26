% Calcula os vetores x e y pedidos e cria o gráfico a partir dos vetores.
% chama a função bissecao para obter o zero "real" da função
% chama newtonquasi para obter as aproximaçoes
% cria vetores x e y e o grafico a partir destes dois vetores.
% root - valor do zero "real" da função
% z - raizes calculadas através de newtonquasi com delta = 1e-4
% raiz - raiz real calculada através do método da bisseção
% x - vetor (ln|e0|, ln|e1|, ..., ln|ek-1|)
% y - vetor (ln|e1|, ln|e2|, ..., ln|ek|)
% Aproveitamos para calcular tambem a estimativa de K_inf - estimaK
[root,fc,k,c,e]=bissecao(@(x) exp(-2*x)*(2*sin(4*x)+cos(4*x))-0.001,0.5,1,1e-15,1e-15,100);

[z,fz,iter]=newtonquasi(@(x) exp(-2*x)*(2*sin(4*x)+cos(4*x))-0.001,0.5,1e-12,100);

niter=numel(iter);

  for i=1:niter-1
    x(i)=iter(i);
    x(i)=abs(root-x(i));
    x(i)=log(x(i));
  end

  for i=1:niter-1
    y(i)=iter(i+1);
    y(i)=abs(root-y(i));
    y(i)=log(y(i));
  end
  
p=polyfit(x,y,1);
draw=min(x)-20:.1:max(x)+20;
w=polyval(p,draw);
plot(draw,w,x,y,'o','LineWidth',1.2)
xlim([min(x)-10 max(x)+10])
ylim([min(y)-10 max(y)+10])

estimaK=abs((iter(end)-iter(end-1))/(iter(end-1)-iter(end-2)));