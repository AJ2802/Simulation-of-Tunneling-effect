function [Hcl H sV0 sV1 sV2] = potential(q,p,a,b,h)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
m=1;
w=sqrt(9/5);
c=1/10;
d=1;

V=c*q^4-1/2*m*w^2*q^2;
sV0=V+(6/5*q^2-9/5)/4/b*h+3/20/b^2*h^2;

Hcl=p^2/2/m+V;
H=1/2/m*(p^2+d*h*(a^2+b^2)/2/b)+sV0;

sV1=4/10*q^3-9/5*q+6*c*q/b*h;
sV2=12/10*q^2-9/5+6*c/b*h;

end

