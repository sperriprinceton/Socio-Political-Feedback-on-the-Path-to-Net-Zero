clear all
close all

Tf=50000;


NS=12.14; %(* ppm reduction in CO2 conc. due to natural sinks for the year 2018*)
a=1;
OF=0;
E0=171.24; %(*10^6 GW Total energy demand for the year 2018*)
% Eta=1.23688155922039;% (* ppm/GW increase in CO2 conc. per GW of energy produced from fossil fuels*)*)
Kappa1=0.08;
Kappa2=0.2;%(*2.25*)
K2=0.2;
% (*K3=0.05;*)
K3=.2;
n=4; %number of blocks
yin=17.77;% (*10^6 GW Clean energy production for the year 2018*)
zin=330;%(*$billion Clean energy Investment for the year 2018*)
K1=(0.1759+K2*yin)/zin;
xin=408.52;
Eta=(2.3+NS+OF)/(E0-yin);% (* ppm/GW increase in CO2 conc. per GW of energy produced from fossil fuels*)

a3=18.2;
a4=0.0027;
xref=280; %ppm pre-industrial CO2 concetration
ScF=1;
phi=1.4231*ScF;
phi1=phi; phi2=phi; phi3=phi;phi4=phi;
epsilon=(0.236*1.4231).^2*ScF;
epsilon1=epsilon;epsilon2=epsilon;epsilon3=epsilon;epsilon4=epsilon;
% tau1=30;
tau1=37;
tau11=tau1;tau12=tau1;tau13=tau1;tau14=tau1;
% mu=.005;
mu=.0035;
mu1=mu;mu2=mu;mu3=mu;mu4=mu;


% [x,y,z,y1,y2,y3,y4,z1,z2,z3,z4,E1,E2,E3,E4,E,A1,A2,A3,A4,x_Max,t_NZ,D1] = ZeroFunDamage_2(E0,n,Tf,xin,yin,zin,Eta,OF,K1,K2,80,.05,a3,a4,xref,phi1,phi2,phi3,phi4,epsilon1,epsilon2,epsilon3,epsilon4,tau11,tau12,tau13,tau14,mu1,mu2,mu3,mu4);

[x_MF,y_MF,z_MF,E_MF,A_MF,D_MF,x_Max_MF,t_NZ_MF] = NetZeroFunDamage(E0,Tf,xin,yin,zin,Eta,OF,K1,K2,80,.05,a3,a4,xref,tau1,phi1,epsilon1,mu1);
[x_WF,y_WF,z_WF,E_WF,A_WF,D_WF,x_Max_WF,t_NZ_WF] = NetZeroFunDamage(E0,Tf,xin,yin,zin,Eta,OF,K1,K2,80,.05,a3,a4,xref,tau1*2.2,phi1,epsilon1,mu1);
[x_SF,y_SF,z_SF,E_SF,A_SF,D_SF,x_Max_SF,t_NZ_SF] = NetZeroFunDamage(E0,Tf,xin,yin,zin,Eta,OF,K1,K2,80,.05,a3,a4,xref,tau1/2.2,phi1,epsilon1,mu1);

plot(x_MF)
hold on
plot(x_WF)
hold on
plot(x_SF)