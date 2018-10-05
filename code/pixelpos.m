clc;
clear;

vid = videoinput('winvideo',1,'YUY2_320x240');
preview(vid);
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
            pos=getpixelposition(m);
            imshow(m);
              
           
        end
    end
    b_img = uint8(b_img);
    image(b_img);
end

stop(vid);

