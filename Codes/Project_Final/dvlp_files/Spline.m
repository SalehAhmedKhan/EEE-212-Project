clear all;
close all;
clc;
hold on;
grid on;
x=0:30:550;
y=[0 4.84 4.84 -1.92 .6 4.71 -1.16 -2.23 3.93 .84 -3.69 1.94 2.88 -3.41 -.507 3.91 -1.78 -.57 3.88];
%x=linspace(-1,1,10);
%y=1./(1+(25*(x.^2)));
x1=x(1):0.01:x(length(x));
%y1=1./(1+(25*(x1.^2)));
x=x*10^-3;
x1=x1*10^-3;

sp=interp1(x,y,x1,'spline','extrap');
%sp=spline(x,y,x1);
plot(x,y,'ro',x1,sp,'b');
%xlabel('x');
%ylabel('f(x)');
%title('Quadratic Spline Interpolation');
%legend('Actual Function','Data points','Interpolated Plot');
%grid on;
[maxi,locmax]=findpeaks(sp,x1);
plot(locmax,maxi,'r+');
[mini,locmin]=findpeaks(-1*sp,x1);
mini=-1*mini;
plot(locmin,mini,'r+');
E=(maxi+mini)/2;
loc=locmax+(abs(locmax-locmin)/2);
E(end)=[];
loc(end)=[];
E(end+1)=maxi(1)/2;
loc(end+1)=0.000001;
sorter=[loc' E'];
sorter=sortrows(sorter);
E=sorter(:,2);
loc=sorter(:,1);
plot(loc,E,'bo');
[a b]=linearization_2_pro(loc,E)

y_=a*exp(-b*x1);
plot(x1,y_)