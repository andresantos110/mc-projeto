% Rotina para obter a tabela pretendida e graficos dos varios polinomios.

xdata = 0:.25:3;
ydata = [0.652 0.217 0.264 0.0689 -0.183 0.209 0.529 0.689 1.18 1.48 2.21 3.09 3.64];
draw = xdata(1)-2:.0001:xdata(end)+2;
n = numel(xdata);   % n de pontos
tab = zeros(10,4);
mmax = 11;  % Maior grau dos polinomios não interpoladores
pval = zeros(mmax,n);
gl = zeros(1,mmax); % graus de liberdade

for m = 0:mmax
    coef{m+1} = polyfit(xdata,ydata,m); % coeficientes dos polinomios grau m
    pval(m+1,:) = polyval(coef{m+1},xdata); % valor do polinomio nos pontos x
    w = polyval(coef{m+1},draw);
    tab(m+1,1)=m;   % 1a coluna - m
    gl(m+1) = n-(m+1);
    tab(m+1,2) = sum((ydata-pval(m+1,:)).^2);   % 2a coluna - SSEm
    tab(m+1,3) = tab(m+1,2)/gl(m+1);    % 3a coluna - MSEm
    txt=['Grau ',num2str(m)];   % texto para fazer a legenda dos polinomios
    
    if m <= (mmax/2)    % divide os polinomios em 2 grupos
       subplot(1,2,1);
       plot(draw,w,'DisplayName',txt,'LineWidth',1.12); % graficos do 1o grupo
       hold on
    else
       subplot(1,2,2);
       plot(draw,w,'DisplayName',txt,'LineWidth',1.12); % graficos do 2o grupo
       hold on
    end
    
    xlim([-.5 3.5]) % limites dos graficos
    ylim([-1 4.5])
    legend show
    legend('Location',"northwest")    
end

for m = 0:(mmax-1)
tab(m+1,4) = tab(m+1,3)/tab(m+2,3); % 4a coluna - MSEm / MSEm+1
end

subplot(1,2,1); % desenho dos pontos (xi,yi) nos graficos
plot(xdata,ydata,'o','LineWidth',1.12,'DisplayName','f(x)')
xlabel('x')
ylabel('y')
hold off
subplot(1,2,2);
plot(xdata,ydata,'o','LineWidth',1.12,'DisplayName','f(x)')
xlabel('x')
ylabel('y')
hold off
tab
