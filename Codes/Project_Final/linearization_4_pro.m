function [r1 r2 c]=linearization_4_pro(x,y,v1,v2)
vinf=v1;
x(length(x))=[];
y(length(y))=[];
n=length(x);


y=log(v1-y);
a1=(n*sum(x.*y)-(sum(x).*sum(y)))/(n*sum(x.^2)-(sum(x))^2);
a0=(sum(y)/n)-(a1*(sum(x)/n));
tau=-1/a1;
vo=v1-exp(a0);

r1=10000;
r2=1000;

c=tau/r1;

end