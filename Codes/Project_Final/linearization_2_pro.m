function [a b]=linearization_2_pro(x,y)


n=length(x);


y=log(y);
a1=(n*sum(x.*y)-(sum(x).*sum(y)))/(n*sum(x.^2)-(sum(x))^2);
a0=(sum(y)/n)-(a1*(sum(x)/n));
a=exp(a0);
b=-a1;
% tau=-1/a1;
% vo=exp(a0);
% r=1000;
% c=tau/r;

end
