function [r,l,v1,v2,t_out,vc_out]=dc_sp_L_dis(t,i,r)
v2=i(1);
i1=i(length(i));
v1=i1*r;

if(issorted(i)==0)
    i=i-i(length(i));
    t_out=t(1):0.001:t(length(t));
    t(find(t==0))=0.000001;
    i(find(i==0))=0.000001;
    
    t(1)=[];
    i(1)=[];
    t(end)=[];
    i(end)=[];
    
    i=log(i);
    
    res=lin_reg(t,i);
    
    tau=(-1/res(1));
    i0=round(exp(res(2)),2);
    l=tau*r;
    
    vc_out=i0*exp(-1*t_out/tau)+i1;
else
    i=i-i(length(0));
    t_out=t(1):0.001:t(length(t));
    vinf=i(length(i));
    
    t(find(t==0))=0.000001;
    i(find(i==0))=0.000001;
    
    t(end)=[];
    i(end)=[];
    
    i=log(vinf-i);
    
    res=lin_reg(t,i);
    
    tau=(-1/res(1));
    i0=round(vinf-exp(res(2)),2);
    
    vc_out=vinf+((i0-vinf)*exp(-1*t_out/tau))+v2;
    
    l=tau*r;
    
    %v1=vinf+v(length(v));
end
