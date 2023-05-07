function [r,c,l,v1,t_out,vc_out]=rlc_critdamped(t,vc,r)

t_out=t(1):0.001:t(length(t));
%cftool
[f, gof] = createFit_cdamp(t,vc);
vc_out=f(t_out);

l=r/(2*f.b);
c=1/(l*f.b*f.b);
v1=(1/c)*euler_imp_val(vc_out,t_out,0);
v1=v1(length(v1));
