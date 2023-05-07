function [r,l,v1,t_out,vc_out]=dcrl_with_source(t,i,r)

t_out=t(1):0.001:t(length(t));
Iinf=i(length(i));

t(find(t==0))=0.000001;
i(find(i==0))=0.000001;

t(end)=[];
i(end)=[];

i=log(Iinf-i);

res=lin_reg(t,i);

tau=(-1/res(1));
i0=round(Iinf-exp(res(2)),2);

vc_out=Iinf+((i0-Iinf)*exp(-1*t_out/tau));

l=tau*r;
v1=Iinf*r;
