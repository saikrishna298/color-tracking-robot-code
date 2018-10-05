clc;
clear;

vid = videoinput('winvideo',1,'YUY2_320x240');
set(vid,'framespertrigger',1);
triggerconfig(vid,'manual');
set(vid,'returnedcolorspace','rgb');
set(vid,'triggerrepeat',inf);
s=[0,0];
count=0;
red=0;
start(vid);
for i=1:200
    trigger(vid);
    m = getdata(vid);
    s = [0,0];
    count=0;
    for row=1:size(m,1)
        for col=1:size(m,2)
            if(m(row,col,1)>(m(row,col,2)+80) && m(row,col,1)>(m(row,col,3)+80)&&m(row,col,1)>120)
                
                s(1,1)=s(1,1)+row;
                s(1,2)=s(1,2)+col;
                count=count+1;
                red(1,count)=row;
                red(2,count)=col;
            end
        end
    end
    try
    s(1,1)=s(1,1)/count;
    s(1,2)=s(1,2)/count;
    sectors=linspace(0,2*pi,100);
    center=[s(1,1),s(1,2)];
    radius=10;
    x=radius*cos(sectors)+center(1,1);
    y=radius*sin(sectors)+center(1,2);
    x=round(x);
    y=round(y);
    for i=1:100
        m(x(i),y(i),:)=0;
    end
    catch exception
    end
    image(m);
end

stop(vid);

