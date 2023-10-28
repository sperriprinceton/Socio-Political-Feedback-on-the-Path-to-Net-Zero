function [x,y,z,E,A,D,x_Max,t_NZ] = NetZeroFunDamage(E0,Tf,xin,yin,zin,Eta,OF,K1,K2,a1,a2,a3,a4,xref,tau11,phi1,epsilon1,mu1)


E=zeros(1,Tf);
E(1)=E0;

x=zeros(1,Tf);
x(1)=xin;

y=zeros(1,Tf);
y(1)=yin;

z=zeros(1,Tf);
z(1)=zin;

D=zeros(1,Tf);
D(1)=0;


for i=2:Tf
 
    E(i)=E0+a1*(1-exp(-a2*i));
    
    x(i)=x(i-1)+Eta*(E(i-1)-y(i-1))-(0 + a3*(1-exp(-a4*x(i-1))))-OF;
    y(i)=y(i-1)+K1*z(i-1)-K2*y(i-1);
    D(i)=phi1*log(x(i-1)/xref)+epsilon1*(log(x(i-1)/xref)).^2;    
    z(i)=z(i-1)+tau11*(1-D(i)./(1+D(i)))*(D(i)-mu1*y(i-1));

end  

A=(D-mu1*y);
t=[1:1:Tf];
%     x_Max=max(x);
%     t_NZ=t(x_Max);
    [x_Max, indexOfMax] = max(x);
t_NZ = t(indexOfMax);

end
