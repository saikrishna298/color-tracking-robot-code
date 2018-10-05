clc;
clear;

vid = videoinput('winvideo',1,'YUY2_320x240');
set(vid,'framespertrigger',1);
triggerconfig(vid,'manual');
set(vid,'returnedcolorspace','rgb');
set(vid,'triggerrepeat',inf);

start(vid);
for i=1:100
    trigger(vid);
    m = getdata(vid);
    b_img = zeros(size(m,1),size(m,2),3);
    for row=1:size(m,1)
        for col=1:size(m,2)
            if(m(row,col,1)>=100 && m(row,col,1)<=200)
                b_img(row,col,1) = 255;
                b_img(row,col,2) = 255;
                b_img(row,col,3) = 255;
            end
        end
    end
    b_img = uint8(b_img);
    image(b_img);
end

stop(vid);

