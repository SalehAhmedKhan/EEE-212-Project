function [r,l,v0,t_out,vc_out]=source_free_rl(t,i,r)

t_out=t(1):0.001:t(length(t));

t(find(t==0))=0.000001;
i(find(i==0))=0.000001;

t(end)=[];
i(end)=[];

i=log(i);

res=lin_reg(t,i);

tau=(-1/res(1));
i0=round(exp(res(2)),2);

v0=r*i0;
l=tau*r;
vc_out=i0*exp(-1*t_out/tau);

