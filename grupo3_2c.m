% Rotina para calcular o n minimo de subintervalos de cada integral
[tab]=integratrap(@(x)(exp(5-x)).*sin(50.*(x-5)),5,11,19);
[n1] = calculon(tab)
[tab]=integratrap(@(x)(2+sin(x-5)).^-1,5,2*pi+5,19);
[n2] = calculon(tab)
[tab]=integratrap(@(x)exp((-x.^2)+10*x-25),5,7,19);
[n3] = calculon(tab)