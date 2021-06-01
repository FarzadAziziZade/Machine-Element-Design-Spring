clc
clear all
close all
Fmax=20;
Fmin=5;
Ymax=2;
Ymin=0.5;
Fa=(Fmax-Fmin)/2;
Fm=(Fmax+Fmin)/2;
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
% Safety factor "nf"
nf=1.5;
% Robust linearity "RL"
RL=0.15;
% Music Wire A228
% dd is the matrix of diameter from Table A-28
dd=[0.069,0.071,0.080,0.085,0.090,0.095,0.105,0.112];
% AA is the matrix that shows answer Table
AA=zeros(12,8);
% with the Sines criterion, Sse=Ssa=35kpsi
Sse=35000;
Ssa=Sse;
Fs=(1+RL)*Fmax;
for i=1:8;
    d=dd(i);
% Table 10-6
% Ssy=0.45*Sut
Ssy=(A/d^m)*0.45;
% Ssu=0.67*Sut
Ssu=(A/d^m)*0.67;
a=Sse/nf;
B=(8*Fa)/(pi*(d^2));
C=((2*a-B)/(4*B))+sqrt(((2*a-B)/(4*B))^2-((3*a)/(4*B)));
D=C*d;
KB=(4*C+2)/(4*C-3);
Ts=(8*Fs)/(pi*(d^2))*(KB*D/d);
Ta=(8*Fa)/(pi*(d^2))*(KB*D/d);
Tm=(8*Fm)/(pi*(d^2))*(KB*D/d);
ns=Ssy/Ts;
nf=Ssa/Ta;
OD=D+d;
ID=D-d;
Na=G*(d^4)*Ymax/(8*(D^3)*Fmax);
% Table 10-1:
Nt=Na+2;
Ls=d*Nt;
Lo=Ls+Fs*Ymax/Fmax;
Locr=2.63*D/aa;
fom=-(cost*(3.14^2)*(d^2)*Nt*D)/4;
% Density*g(g=386)=0.284
W=((pi^2)*(d^2)*D*Na*0.284)/4;
fn=0.5*sqrt(386*Fmax/(Ymax*W));
AA(1,i)=D;
AA(4,i)=C;
AA(3,i)=OD;
AA(2,i)=ID;
AA(5,i)=Na;
AA(6,i)=Ls;
AA(7,i)=Lo;
AA(8,i)=Locr;
AA(9,i)=nf;
AA(10,i)=ns;
AA(11,i)=fn;
AA(12,i)=fom;
end
AA
for i=1:8;
if AA(4,i)<=4
    AA(4,i)=0;
elseif AA(4,i)>=12
      AA(4,i)=0;
end
if AA(5,i)<=3
    AA(5,i)=0;
elseif AA(5,i)>=15
      AA(5,i)=0;
end
if AA(10,i)<=1.5
    AA(10,i)=0;
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
if AA(11,i)<=100
    AA(11,i)=0;
end
end
% AA(i,j)=0 means Error!
AA
for i=1:8;
    for j=1:12;
      if AA(j,i)==0
          for j=1:12;
          AA(j,i)=0;
          end
      end
    end
end
AA