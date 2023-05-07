clc
clear;
close all;

x=linspace(-1,1,6);
xs=x.*x;
y_=(1+25*xs);
y=1./y_;
plot(x,y,'go')
hold on

xn=linspace(-1,1,100);
xns=xn.*xn;
yn_=(1+25*xns);
yn=1./yn_;

plot(xn,yn,'b')
hold on
n = length(x)-1;

mat = [0;zeros(2*n,1);zeros(n-1,1)];
z =   zeros(length(mat),length(mat));
j=1;
f=1;
for i=2:2:2*n    
    z(i,f:f+2)=[x(j)^2 x(j) 1];
    mat(i) = y(j);
    j=j+1;
    z(i+1,f:f+2)=[x(j)^2 x(j) 1];  
    mat(i+1)= y(j);
    f= f+3;
end
j=1;
l=2;
for i=2*n+2:3*n
    
    z(i,j:j+1) = [2*x(l) 1];
    z(i,j+3:j+4)= [-2*x(l) -1];
    j = j+3;
    l = l+1;
end
z(1,1)=1;
Coef=z\mat;
j=1;
for i=1:n
    curve=@(l) Coef(j)*l.^2+Coef(j+1)*l+Coef(j+2);
    ezplot(curve,[x(i),x(i+1)]);
    hold on
    j=j+3;
end

 xlim auto;
 ylim auto;


xlabel('x','fontsize',13);
ylabel('f(x)','fontsize',13);
title('Quadratic Interpolation with 6 pairs of Data Points');
legend('data point','actual curve','quadratic interpolation');
disp(Coef')










