function [r,c,v0,t_out,vc_out]=source_free_rc(t,v,r)

t_out=t(1):0.01:t(length(t));

t(find(t==0))=0.000001;
v(find(v==0))=0.000001;

t(1)=[];
v(1)=[];
t(end)=[];
v(end)=[];

v=log(v);

res=lin_reg(t,v);

tau=(-1/res(1));
v0=round(exp(res(2)),2);

c=tau/r;

vc_out=v0*exp(-1*t_out/tau);

