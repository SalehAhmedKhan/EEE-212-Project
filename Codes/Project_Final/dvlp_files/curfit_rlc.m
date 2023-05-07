clear all;
close all;
clc;

t=[0 0.437 1.286 2 4.368 10 20 40 60 80 100];
i=[0 0.4 1 1.4 2 2.14 1.68 0.988 0.578 0.338 0.198];
t=t*10^-3;
i=i*10^-3;

t1=t(1):0.001:t(length(t));
t_test=t(1):0.001:5*t(length(t));
plot(t,i,'ro');
hold on;
grid on;

f=fit(t',i','exp2');
i1=f(t1);
plot(t1,i1);

s1=f.b;
s2=f.d;

a=-1*(s1+s2)/2;
w=sqrt((a*a)-((a+s1)*(a+s1)));
r=4000;
l=r/(2*a);
c=1/(l*w*w);
v1=@(t_test) (1/c)*(((f.a/f.b)*exp(f.b*t_test))+((f.c/f.d)*exp(f.d*t_test)));
v_c=v1(t_test)-v1(0);
v_c=v_c(length(v_c))

%cftool
