function [r1 r2 c]=linearization_3_pro(x,y,vs)
vinf=y(length(y));
x(length(x))=[];
y(length(y))=[];
n=length(x);


y=log(vinf-y);
a1=(n*sum(x.*y)-(sum(x).*sum(y)))/(n*sum(x.^2)-(sum(x))^2);
a0=(sum(y)/n)-(a1*(sum(x)/n));
tau=-1/a1;
vo=vinf-exp(a0);

r2=10000;
r1=r2*((vs/vinf)-1);
c=tau/r2;

end