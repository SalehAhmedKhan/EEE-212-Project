clear all;
close all;
clc;

t=[0 1.13 2.262 4.903 10 17.79 25.426 35.763 50 100];
i=[0 1 2.05 3 3.678 3 2 1 0.336 0];
t=t*10^-3;
i=i*10^-3;
plot(t,i,'r+');
grid on;
hold on;
t1=t(1):0.001:t(length(t));
%cftool
[f, gof] = createFit_cdamp(t, i);
i1=f(t1);
plot(t1,i1);

r=2000
l=r/(2*f.b)
c=1/(l*f.b*f.b)
v1=(1/c)*euler_imp_val(i1,t1,0);
v1=v1(length(v1))

