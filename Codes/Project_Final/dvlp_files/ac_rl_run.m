clear all;
close all;
clc;

t=[0 20 40 60 80 100 120 140 160 180 200 220 240 260 280 300 315 330.5 350 375 390 410 425 440 460 480 500 515];
t=t/1000;
i=[0 32.37 37.08 -8.31 6.383 35.866 -2.8875 -13.07 28.268 9.726 -22.678 13.678 21.885 -20.973 -2.867 27.536 2.4316 -25.076 2.8821 17.173 -17.173 -12.614 20.973 19.909 -22.644 -4.1899 26.444 1.3678];
i=i*10^-3;

ac_rl(t,i,80);

%hold on;

%t_ac=t(1):0.001:t(length(t));
%i_ac=0.0393*sin(20*pi*t_ac-1.413)+0.0388*exp(-10*t_ac);

%plot(t_ac,i_ac,'k--');

%c=[t' i']

%cftool
