% f - função que queremos aproximar o integral 
% alpha - limite inferior do integral
% beta - limite superior do integral
% numero de iteradas máximas 2^MaxK
% retorna uma tabela (tab) com as colunas de n, Tn, |T2n-Tn|, |T2n-Tn|/|T4n-T2n|
function [tab] = integratrap(f,alpha,beta,MaxK)
tab=zeros(MaxK,4);

for k=1:MaxK
n=2^k;  
h=(beta-alpha)/n;
x= alpha:h:beta;
y=feval(f,x);
tab(k,1)=n;
tab(k,2)= trapz(x,y);

   if(k>1)
       tab(k,3)= abs(tab(k,2)-tab(k-1,2));
   end
   
   if(k>2)
       tab(k,4)= abs(tab(k-1,3)/tab(k,3));
   end
   
end

end

