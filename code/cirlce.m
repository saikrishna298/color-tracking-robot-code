clc;

clear;
sectors=linspace(0,2*pi,100);
center=[5,5];
radius=3;
x=radius*cos(sectors)+center(1,1);
y=radius*sin(sectors)+center(1,2);
plot(x,y);
