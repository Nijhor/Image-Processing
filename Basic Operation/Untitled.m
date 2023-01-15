%% 
%Ques 1
i1 = imread('img1.jpg');
bw1 = im2bw(i1);
p1 = bwperim(bw1,4);
p2 = bwperim(bw1,8);
figure,imshowpair(p1,p2,'montage')
%% 
%%Ques 2
i2 = imread('img2.jpg');
bw2 = imbinarize(i2, 'adaptive');
figure,imshowpair(i2,bw2,'montage')

%%
%Ques 3
se = strel('disk',4);
ao = imopen(i2,se);
ac = imclose(ao,se);
bw3 = im2bw(ac);
[L,number_of_objects]=bwlabel(bw3,4)

%%
%Ques 4

imshow('img2.jpg')
h = imdistline(gca,[10 100],[10 100]);
%%
%Ques 5 
%(a)
resize_image = imresize(i2,[size(i1,1) size(i1,2)]);
add = imadd(i1,resize_image);
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(add);title('Additional Image');
%%
%b
sub = imsubtract(i1,resize_image);
figure,imshow(sub)
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(sub);title('Subtracted Image');

%%
%c
mul = immultiply(i1,resize_image);
figure,imshow(mul)
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(mul);title('Multiplicated Image');
%%
%d
div = imdivide(i1,resize_image);
figure,imshow(div)
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(div);title('Multiplicated Image');

%%
%Ques 6
%a
and = bitand(i1,resize_image);
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(and);title('And Image');
%%
%b
or = bitor(i1,resize_image);
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(resize_image);title('img 2');
subplot(2,2,3);imshow(or);title('OR Image');
%%
%c
not1 = bitcmp(i1);
not2 = bitcmp(i2);
subplot(2,2,1);imshow(i1);title('img 1');
subplot(2,2,2);imshow(i2);title('img 2');
subplot(2,2,3);imshow(not1);title('Not on image 1');
subplot(2,2,4);imshow(not2);title('Not on image 2');
%%
%Ques 7
i3 = imread('img3.jpg');
ni = 255 - i3;
imshowpair(i3,ni,'montage')

%%
%Ques 8
i4 = imread('img4.jpg');
i4 = double(i4);
B=bitget(i4,1);  
subplot(2,4,1);imshow((B));title('Bit plane 1');
B=bitget(i4,2);  
subplot(2,4,2);imshow((B));title('Bit plane 2');
B=bitget(i4,3); 
subplot(2,4,3);imshow((B));title('Bit plane 3');
B=bitget(i4,4); 
subplot(2,4,4);imshow((B));title('Bit plane 4');
B=bitget(i4,5); 
subplot(2,4,5);imshow((B));title('Bit plane 5');
B=bitget(i4,6); 
subplot(2,4,6);imshow((B));title('Bit plane 6');
B=bitget(i4,7);  
subplot(2,4,7);imshow((B));title('Bit plane 7');
B=bitget(i4,8); 
subplot(2,4,8);imshow((B));title('Bit plane 8');

%%
%Ques 9
i4 = imread('img4.jpg');
cont = imadjust(i4,stretchlim(i4),[]);
imshowpair(i4,cont,'montage')

%%
%Ques 10
%logarithmic transformation
i21 = imread('img2.jpg');
i211 = double(i21);
x = i211;
[r,c] = size(i211);
factor= 0.05;
for i = 1:r;
    for j= 1:c;
        x(i,j) = factor*log(1+i211(i,j));
    end
end

imshowpair(i21,x,'montage')
%%
i21 = imread('img2.jpg');
i211 = double(i21);
x = i211;
[r,c] = size(i211);
factor= .00001;
for i = 1:r;
    for j= 1:c;
        x(i,j) = factor*(i211(i,j))^2;
    end
end

imshowpair(i21,x,'montage')
