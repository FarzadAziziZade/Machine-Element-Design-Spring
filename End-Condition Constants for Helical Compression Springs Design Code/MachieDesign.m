clear all
close all
clc
Lf=linspace(4,20,1000);
G=82.7*(10^9);
E=203.4*(10^9);
C1=E/(2*(E-G));
C2=(2*(pi^2)*(E-G))/(2*G+E);
D=2;
X=Lf/D;
a=1;
Aeff=(a\D)*Lf;
for i=1:1000;
    y(i)=Lf(i)*C1*(1-(1-(C2/(Aeff(i))^2))^0.5);
    Y(i)=y(i)/Lf(i);
end
plot(X,Y,'color','red')
hold on
a=2;
Aeff=(a\D)*Lf;
for i=1:1000;
    y(i)=Lf(i)*C1*(1-(1-(C2/(Aeff(i))^2))^0.5);
    Y(i)=y(i)/Lf(i);
end
plot(X,Y,'color','black')
hold on
a=0.5;
Aeff=(a\D)*Lf;
for i=1:1000;
    y(i)=Lf(i)*C1*(1-(1-(C2/(Aeff(i))^2))^0.5);
    Y(i)=y(i)/Lf(i);
end
plot(X,Y,'color','green')
hold on
a=0.707;
Aeff=(a\D)*Lf;
for i=1:1000;
    y(i)=Lf(i)*C1*(1-(1-(C2/(Aeff(i))^2))^0.5);
    Y(i)=y(i)/Lf(i);
end
plot(X,Y,'color','blue')
hold on