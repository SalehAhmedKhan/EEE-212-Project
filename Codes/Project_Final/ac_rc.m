function[r,c,v1,freq,t_out,vc_out]=ac_rc(t,v,r)

%hold on;
%grid on;
%plot(t,v,'ro');

[fitresult, gof] = createFit(t, v);
t_out=t(1):0.001:t(length(t));

vc_out=fitresult(t_out);
%vc_out=triginterp(t_out,t,v);
%vc_out=spline(t,v,t_out);
%plot(t_out,vc_out,'b');

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
loc=locmax+(abs(locmax-locmin)/2);

loc(E<0)=[];
E(E<0)=[];
E(end+1)=maxi(1)/2;
loc(end+1)=locmax(1)/2;

E(end+1)=abs(min(maxi-mini)/2);
loc(end+1)=0.0001;

%plot(loc,E,'bo');

sorter=[loc' E];
sorter=sortrows(sorter);
E=sorter(:,2);
loc=sorter(:,1);

[a,b]=linearization_2_pro(loc,E);

y_=a*exp(-b*t_out);

%plot(t_out,y_);

tau=1/b;

c=tau/r;


T=round(abs(mean(locmax-locmin)*2),2);

freq=(1/T);

w=2*pi*freq;

ampli=abs(mean(maxi-mini)/2);

theta=atan(1/(w*r*c));

v1=ampli*sqrt(r^2+(1/(w*c))^2)*w*c;

vc_out=-1*ampli*cos(w*t_out+theta)+ampli*cos(theta)*exp(-1*t_out/tau);

%plot(t_out,vc_out,'r');