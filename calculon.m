% Calcula o numero minimo de subintervalos para que o erro seja < 1e-6
% Erro calculado através da aproximação (para n's elevados):
% eerr = |T2n-Tn|/3
% Entradas:
% tab - tabela calculada com [tab]=integratrap(...)
% (3a coluna de tab = |T2n-Tn|)
% Saidas:
% n - numero minimo de subintervalos
function [n] = calculon(tab)
eerr = tab(:,3)./3;
dim = size(eerr);
for i = 2:dim(1)
    if eerr(i) < 1e-6
        n = 2^(i);
        break
    end
end
end