load aerogerador.dat;
x=aerogerador(:,1); %valores de entrada
y=aerogerador(:,2); %valores de saída


plot(x,y,'b*')
title('Aerogerador');   %plota as funções High, Low e Medium
xlabel('Velocidade do Vento(m/s)');
ylabel('Potência Gerada(kW)');


 X=[ones(length(x),1)  x.^5 x.^4 x.^3 x.^2 x]; %matriz de variáveis x (grau 5)
% X=[ones(length(x),1)  x.^4 x.^3 x.^2 x]; %matriz de variáveis x (grau 4)
% X=[ones(length(x),1)  x.^3 x.^2 x]; %matriz de variáveis x (grau 3)
% X=[ones(length(x),1)  x.^2 x]; %matriz de variáveis x (grau 2)
beta=inv(X'*X)*X'*y; %matriz de coeficientes
Y=X*beta;   %saída aproximada
hold on
plot(x, Y,'r')
grid
E=y-Y; %matriz dos erros



R2=1-sum((y-Y).^2)/sum((y-mean(y)).^2) %média R2

R2aj=1-sum((y-Y).^2)/sum((y-mean(y)).^2)*((length(x)-1)/(length(x)-length(X(1,:)))) %média R2 ajustada