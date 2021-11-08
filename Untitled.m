p=0:100;
pp=60; %pressão do pedal
vr=55; %Velocidade da roda
vc=80; %velocidade do carro
L=(heaviside(p+10)-heaviside(p-50)).*(-p+50)/50; %baixa
H=heaviside(p-50).*(p-50)/50;  %alta
M=(heaviside(p-30)-heaviside(p-50)).*(p-30)/20+(heaviside(p-50)-heaviside(p-70)).*(70-p)/20; %média intensidade
A=p/100;  %função aperte o freio
R=(100-p)/100; %função libere o freio

%  hold on
%  plot(A)
%  plot(R)    %plota as funções A e R
%  title('''Aperte o freio'' e ''Libere o freio''');
%  xlabel('Pressão');
 


%  figure, plot(H,'b')
%  plot(H,'r')
%  plot(M,'y')
%  title('Alto');   %plota as funções High, Low e Medium
%  xlabel('p');
%  ylabel('H(p)');


     %regra 1
     a=M(pp); %pega o valor médio da pressão no pedal
     %regra 2
    if H(pp)<H(vc) && H(pp)<H(vr)
        b=H(pp);
    end
    
    if H(vc)<H(vr) && H(vc)<H(pp)   %pega o menor valor
        b=H(vc);
    end
    
    if H(vr)<H(pp) && H(vr)<H(vc)
        b=H(vr);
    end
    
    
    
   %regra 3
    if    H(vr)<H(pp) &&  H(vr)<L(vr)
        c=H(vr);
    end
    if H(pp)<H(vr) &&  H(pp)<L(vr)
        c= H(pp);
    end
    if L(vr)<H(pp) && L(vr)<H(vc)
        c= L(vr);
    end    
 
  %regra 4
  d=L(pp);
 


soma1=0;
soma2=0;


if a+b>d+c  %primeiro caso, onde o valor de freada excede o de soltar o freio
X=(c+d)*heaviside(100*(c+d)-p)+A.*(heaviside(p-100*(c+d))-heaviside(p-100*(a+b)))+(a+b)*heaviside(p-100*(a+b));
for i=1:20
     
    soma1=5*i*X(5*i)+soma1;
    soma2=X(5*i)+soma2;
end
Freio=soma1/soma2
end


if d+c>a+b  %segundo caso
    X=(a+b)*heaviside(100*(a+b)-p)+A.*(heaviside(p-100*(a+b))-heaviside(p-100*(c+d)))+(c+d)*heaviside(p-100*(c+d));
for i=1:20
     
    soma1=5*i*X(5*i)+soma1;
    soma2=X(5*i)+soma2;
end
LiberarFreio=soma1/soma2
end





% hold on
% plot(p,X)
% plot(A,'r')
% plot(R,'g')
% plot(a+b,'y')
% plot(c+d,'y')

