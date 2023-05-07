function [r c]=linearization_1_pro(x,y)
vinf=y(length(y));
x(length(x))=[];
y(length(y))=[];
n=length(x);


y=log(vinf-y);
a1=(n*sum(x.*y)-(sum(x).*sum(y)))/(n*sum(x.^2)-(sum(x))^2);
a0=(sum(y)/n)-(a1*(sum(x)/n));
tau=-1/a1;
vo=vinf-exp(a0);
r=1000;
c=tau/r;

end
