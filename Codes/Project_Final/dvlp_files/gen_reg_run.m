clear all;
close all;
clc;

x=[0 1 2 3 4 5];
y=[2.1 7.7 13.6 27.2 40.9 61.1];

equ=gen_reg(x,y,2);

p=flip(equ');
z=x(1):0.01:x(length(x));
p=polyval(p,z);

plot(z,p);
hold on
plot(x,y,'r+');