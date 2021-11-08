load aerogerador.dat;
x=aerogerador(:,1); %valores de entrada
y=aerogerador(:,2); %valores de sa�da


plot(x,y,'b*')
title('Aerogerador');   %plota as fun��es High, Low e Medium
xlabel('Velocidade do Vento(m/s)');
ylabel('Pot�ncia Gerada(kW)');


 X=[ones(length(x),1)  x.^5 x.^4 x.^3 x.^2 x]; %matriz de vari�veis x (grau 5)
% X=[ones(length(x),1)  x.^4 x.^3 x.^2 x]; %matriz de vari�veis x (grau 4)
% X=[ones(length(x),1)  x.^3 x.^2 x]; %matriz de vari�veis x (grau 3)
% X=[ones(length(x),1)  x.^2 x]; %matriz de vari�veis x (grau 2)
beta=inv(X'*X)*X'*y; %matriz de coeficientes
Y=X*beta;   %sa�da aproximada
hold on
plot(x, Y,'r')
grid
E=y-Y; %matriz dos erros



R2=1-sum((y-Y).^2)/sum((y-mean(y)).^2) %m�dia R2

R2aj=1-sum((y-Y).^2)/sum((y-mean(y)).^2)*((length(x)-1)/(length(x)-length(X(1,:)))) %m�dia R2 ajustada