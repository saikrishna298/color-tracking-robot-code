clear;
clc;

vid = videoinput('winvideo',1,'YUY2_320x240');
set(vid,'returnedcolorspace','rgb');
triggerconfig(vid,'manual');
set(vid,'triggerrepeat',inf);
set(vid,'framespertrigger',1);

start(vid);

for i=1:100
    trigger(vid);
    img = getdata(vid);
    imwrite(img,sprintf('%d.png',i));
    image(img);
end

stop(vid);
delete(vid);
