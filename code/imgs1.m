img=imread('E:\\Hd WALLS\\3D_Landscape_084.png');
target=zeros(size(img,1),size(img,2));
for i=1:size(img,1)
    for j=1:size(img,2)
        c=img(i,j,1);
        if(c>=100&&c<=200)
            target(i,j)=1;
        else
            target(i,j)=0;
      
        end
    end
end
imshow(target);