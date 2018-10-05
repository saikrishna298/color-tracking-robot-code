img=imread('E:\\Hd WALLS\\420687_339525019416083_100000757645222_893753_700454076_n.jpg');
target=zeros(size(img,1),size(img,2));
for i=1:size(img,1)
    for j=1:size(img,2)
        c=img(i,j,1);
        if(c>100)
            target(i,j)=1;
        end
    end
end
imshow(target);