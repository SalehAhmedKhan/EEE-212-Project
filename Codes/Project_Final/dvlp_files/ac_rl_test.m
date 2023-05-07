clear all;
close all;
clc;
hold on;
grid on;
x=[0 30 60 90 120 150 180 210 240 270 300 330 360 390 420 450 480 510 540];
y=[0 4.84 4.84 -1.92 0.6 4.71 -1.16 -2.23 3.93 0.84 -3.69 1.94 2.88 -3.42 -0.507 3.91 -1.78 -0.57 3.88];

%y=y*10^-3;
%x=linspace(-1,1,10);
x=x*10^-3;
%y=1./(1+(25*(x.^2)));
x1=x(1):0.0001:x(length(x));
%y1=1./(1+(25*(x1.^2)));



sp=triginterp(x1,x,y);
plot(x,y,'ro',x1,sp,'b--');
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
loc=locmin+(abs(locmax-locmin)/2);
E(end)=[];
loc(end)=[];
%E(end+1)=maxi(1)/2;
%loc(end+1)=0.000001;
sorter=[loc' E'];
sorter=sortrows(sorter);
E=sorter(:,2);
loc=sorter(:,1);
plot(loc,E,'bo');
[a,b]=linearization_2_pro(loc,E)
y_=a*exp(-b*x1);
plot(x1,y_);

tau=1/b
r=5000
c=tau/r
T=max(locmax-locmin)*2;
freq=1/T
w=2*pi*freq;
if(length(maxi)>=length(mini))
    n=length(mini);
else
    n=length(maxi);
end
ampli=max((maxi(1:n)-mini(1:n))/2)

source_ampli=c*w*ampli*sqrt(r^2+(1/(w*c))^2)

theta=atan(1/(w*c*r));
y_final=ampli*sin(w*x1)+y_;

plot(x1,y_final,'r');
