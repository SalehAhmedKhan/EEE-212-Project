function [r,c,v1,t_out,vc_out]=dcrc_with_source(t,v,r)

t_out=t(1):0.001:t(length(t));
vinf=v(length(v));

t(find(t==0))=0.000001;
v(find(v==0))=0.000001;

t(end)=[];
v(end)=[];

v=log(vinf-v);

res=lin_reg(t,v);

tau=(-1/res(1));
v0=round(vinf-exp(res(2)),2);

vc_out=vinf+((v0-vinf)*exp(-1*t_out/tau));

c=tau/r;

v1=vinf;
