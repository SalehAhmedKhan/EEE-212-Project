function [r,c,l,v1,t_out,vc_out]=rlc_underdamped(t,vc,r)

%hold on;
%grid on;
%plot(t,vc,'ro');

t_out=t(1):0.001:t(length(t));
vc_out=spline(t,vc,t_out);

%plot(t,vc,'r.',t_out,vc_out,'b');

[maxi,locmax]=findpeaks(vc_out,t_out);
[mini,locmin]=findpeaks(-1*vc_out,t_out);
mini=-1*mini;

%plot(locmax,maxi,'r+',locmin,mini,'r+');

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

%plot(loc,E,'bo');

sorter=[loc' E'];
sorter=sortrows(sorter);
E=sorter(:,2);
loc=sorter(:,1);

[a,b]=linearization_2_pro(loc,E);

y_=a*exp(-b*t_out);

%plot(t_out,y_);

T=abs(mean(locmax-locmin)*2);

freq=1/T;

wd=2*pi*freq;

w=sqrt(wd^2+b^2);

l=r/(2*b);

c=1/(w*w*l);

v1=(1/c)*euler_imp_val(vc_out,t_out,0);
v1=v1(length(v1));