function [r,c,v1,v2,t_out,vc_out]=dc_sp_C_dis(t,v,r)
v2=v(1);
v1=v(length(v));
if(issorted(v)==0)
    v=v-v(length(v));
    t_out=t(1):0.001:t(length(t));
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
    
    vc_out=v0*exp(-1*t_out/tau)+v1;
else
    v=v-v(length(0));
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
    
    vc_out=vinf+((v0-vinf)*exp(-1*t_out/tau))+v2;
    
    c=tau/r;
    
    %v1=vinf+v(length(v));
end
