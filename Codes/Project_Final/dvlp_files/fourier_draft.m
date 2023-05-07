clear all;
close all;
clc;
grid on;
hold on;

t=[0 10 25 60 85.6 125 150 205 250 300 350 400 450 500 550 600 650 700 750 800 850 900];
i=[0 11 17 6 -10.3 -5.97 5.775 0 -5.49 4.5 -1.276 -1.437 2.232 -1.46 0.182 0.0746 -0.843 0.425 0.075 -0.34 0.3 0]; 
t=t*10^-3;
i=i*10^-3;
f=fit(t',i','fourier8');

t_out=t(1):0.001:t(length(t));

%vc_out=f(t_out);
vc_out=spline(t,i,t_out);

plot(t,i,'ro',t_out,vc_out,'b');

[maxi,locmax]=findpeaks(vc_out,t_out);
[mini,locmin]=findpeaks(-1*vc_out,t_out);
mini=-1*mini;

plot(locmax,maxi,'r+',locmin,mini,'r+');

if(length(maxi)>length(mini))
    maxi=maxi(1:length(mini));
    locmax=locmax(1:length(locmin));
elseif(length(maxi)<length(mini))
    mini=mini(1:length(maxi));
    locmin=locmin(1:length(locmax));
end

E=(maxi+mini)/2;
loc=locmax+(abs(locmax-locmin));

loc(E<0)=[];
E(E<0)=[];

plot(loc,E,'bo');

sorter=[loc' E'];
sorter=sortrows(sorter);
E=sorter(:,2);
loc=sorter(:,1);

[a,b]=linearization_2_pro(loc,E)

y_=a*exp(-b*t_out);

plot(t_out,y_);

T=abs(mean(locmax-locmin)*2);

freq=1/T

wd=2*pi*freq;

w=sqrt(wd^2+b^2)

r=100

l=r/(2*b)

c=1/(w*w*l)