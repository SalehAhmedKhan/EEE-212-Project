function [r,c,l,v1,t_out,vc_out]=rlc_overdamped(t,vc,r)

f=fit(t',vc','exp2');
t_out=t(1):0.001:2*t(length(t));
vc_out=f(t_out);

s1=f.b;
s2=f.d;

a=-1*(s1+s2)/2;
w=sqrt((a*a)-((a+s1)*(a+s1)));
l=r/(2*a);
c=1/(l*w*w);

t_c=t(1):0.001:5*t(length(t));
v1=@(t_c) (1/c)*(((f.a/f.b)*exp(f.b*t_c))+((f.c/f.d)*exp(f.d*t_c)));
v_c=v1(t_c)-v1(0);
v1=v_c(length(v_c));
