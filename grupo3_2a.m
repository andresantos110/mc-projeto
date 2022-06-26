% Rotina para obter os graficos das 3 funçoes nos intervalos de integração.

x1=5:.001:11;
x2=5:.001:(2*pi+5);
x3=5:.001:7;
f1=exp(5-x1).*sin(50.*(x1-5));
f2=1./(2+sin(x2-5));
f3=exp(-x3.^2+10.*x3-25);
subplot(1,3,1);
plot(x1,f1)
xlabel('x')
ylabel('y')
title('exp(5-x)*sin(50*(x-5))')
subplot(1,3,2);
plot(x2,f2)
xlim([5 2*pi+5])
xlabel('x')
ylabel('y')
title('1/(2+sin(x-5))')
subplot(1,3,3);
plot(x3,f3)
xlabel('x')
ylabel('y')
title('exp(-x^2+10*x-25)')