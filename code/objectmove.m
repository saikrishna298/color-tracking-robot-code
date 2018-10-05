clc;
clear;

%vid = videoinput('USB2.0 PC CAMERAwinvideo',1,'YUY2_320x240');
vid = videoinput('winvideo',1,'YUY2_320x240');
set(vid,'framespertrigger',1);
triggerconfig(vid,'manual');
set(vid,'returnedcolorspace','rgb');
set(vid,'triggerrepeat',inf);
s=[0,0];
count=0;
red=0;
start(vid);
c=[120,160];
SC = serial('COM12','baudrate',9600);
fopen(SC);
for i=1:200
    trigger(vid);
    m = getdata(vid);
    s = [0,0];
    count=0;
    for row=1:size(m,1)
        for col=1:size(m,2)
            if(m(row,col,1)>(m(row,col,2)+80) && m(row,col,1)>(m(row,col,3)+80)&& m(row,col,1)>120)
                
                s(1,1)=s(1,1)+row;
                s(1,2)=s(1,2)+col;
                count=count+1;
                red(1,count)=row;
                red(2,count)=col;
            end
        end
    end
  %  disp(count);
    try
    s(1,1)=s(1,1)/count;
    s(1,2)=s(1,2)/count;
    sectors=linspace(0,2*pi,100);
    center=[s(1,1),s(1,2)];
    radius=10;
    x=radius*cos(sectors)+center(1,1);
    y=radius*sin(sectors)+center(1,2);
    image(m);
    hold all;
    plot(y,x,'k.');
    hold off;
    if(s(1,1)<(c(1,1)-20))
        fwrite(SC,'B');
        fwrite(SC,'B');
        %fwrite(SC,'B');
    elseif(s(1,1)>(c(1,1)+20))
        fwrite(SC,'F');
        fwrite(SC,'F');
        %fwrite(SC,'F');
    end
    if(s(1,2)<(c(1,2)-20))
        fwrite(SC,'L');
        fwrite(SC,'L');
        %fwrite(SC,'L');
    elseif(s(1,2)>(c(1,2)+20))
        fwrite(SC,'R');
        fwrite(SC,'R');
        %fwrite(SC,'R');
    end 
    
    x=round(x);
    y=round(y);
    for i=1:100
        m(x(i),y(i),:)=0;
    end
    catch exception
        image(m);
    end
end
fclose(SC);
stop(vid);

