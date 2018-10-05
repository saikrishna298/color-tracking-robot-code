clc;
clear;
m=imread('E:\\Hd WALLS\\420687_339525019416083_100000757645222_893753_700454076_n.jpg');
b_img = zeros(size(m,1),size(m,2),3);
s=[0,0];
count=0;
red = 0;
for row=1:size(m,1)
        for col=1:size(m,2)
            if(m(row,col,1)>(m(row,col,2)+80) && m(row,col,1)>(m(row,col,3)+80)&&m(row,col,1)>120)
                b_img(row,col,1)=255;
                b_img(row,col,2)=255;
                b_img(row,col,3)=255;
                
                s(1,1)=s(1,1)+row;
                s(1,2)=s(1,2)+col;
                count=count+1;
                red(1,count) = row;
                red(2,count) = col;
             end
        end
end
    s(1,1)=s(1,1)/count;
    s(1,2)=s(1,2)/count;
    b_img = uint8(b_img);
    image(b_img);
    plot(red(1,:),red(2,:),'k.')
    hold all;
    plot(s(1),s(2),'r*')
    hold off;   
   
