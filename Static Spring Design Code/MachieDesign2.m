clc
clear all
close all
Fmax=20;
Ymax=2;
% Spring supported between flat parallel surfaces Constant aa=0.5
aa=0.5;
% Table 10-4
cost=2.6;
% Table 10-4
A=201000;
% Table 10-5
m=0.145;
% expecting d>0.064in
E=28.5*10^6;
G=11.75*10^6;
% Ends squared and ground
% Safety factor "ns"
ns=1.2;
% Robust linearity "RL"
RL=0.15;
% Music Wire A228
% dd is the matrix of diameter from Table A-28
dd=[0.063,0.067,0.071,0.075,0.080,0.085,0.090,0.095];
% AA is the matrix that shows answer Table
AA=zeros(10,8);
for i=1:8;
    d=dd(i);
% Table 10-6
% Ssy=0.45*Sut
Ssy=(A/d^m)*0.45;
a=Ssy/ns;
B=(8*(1+RL)*Fmax)/(pi*(d^2));
C=((2*a-B)/(4*B))+sqrt(((2*a-B)/(4*B))^2-((3*a)/(4*B)));
D=C*d;
KB=(4*C+2)/(4*C-3);
Ts=(8*(1+RL)*Fmax)/(pi*(d^2))*(KB*D/d);
ns=Ssy/Ts;
OD=D+d;
ID=D-d;
Na=G*(d^4)*Ymax/(8*(D^3)*Fmax);
% Table 10-1:
Nt=Na+2;
Ls=d*Nt;
Lo=Ls+(1+RL)*Ymax;
Locr=2.63*D/aa;
fom=-(cost*(3.14^2)*(d^2)*Nt*D)/4;
AA(1,i)=D;
AA(2,i)=C;
AA(3,i)=OD;
AA(4,i)=ID;
AA(5,i)=Na;
AA(6,i)=Ls;
AA(7,i)=Lo;
AA(8,i)=Locr;
AA(9,i)=ns;
AA(10,i)=fom;
end
AA
for i=1:8;
if AA(2,i)<=4
    AA(2,i)=0;
elseif AA(2,i)>=12
      AA(2,i)=0;
end
if AA(5,i)<=3
    AA(5,i)=0;
elseif AA(5,i)>=15
      AA(5,i)=0;
end
if AA(9,i)<=1.2
    AA(9,i)=0;
end
if AA(6,i)>=1
    AA(6,i)=0;
end
if AA(8,i)<=AA(7,i)
    AA(8,i)=0;
end
if AA(7,i)>=4
    AA(7,i)=0;
end
end
% AA(i,j)=0 means Error!
AA
for i=1:8;
    for j=1:10;
      if AA(j,i)==0
          for j=1:10;
          AA(j,i)=0;
          end
      end
    end
end
AA