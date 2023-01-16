%%
% Ques - 1
% a)	Read and show the image.
I1 = imread('i-1.jpg');
s = imshow(I1);
%%
% b)	Show the matrix form of the image.
disp(I1);
%%
% c)	Show the pixel information by hovering the cursor on the image.
impixelinfo();
%%
% d)	Find the value of the pixel (10, 78).
r_v = I1(10,78,1);
g_v = I1(10,78,2);
b_v = I1(10,78,3);
sprintf('value of red, green, blue is %d %d %d',r_v,g_v,b_v)
%%
% e)	Show the size of the image.
size(I1)
%%
% f)	Show the all the information of the image.
imfinfo('i-1.jpg')
imageinfo(s)
%%
% Ques - 2
% a)	Read and show all three types of images (RGB, Grayscale, and Indexed).
I2 = imread('i-2.jpg');
I3 = imread('i-3.jpg');
[I4,I4map] = imread('i-4.png');

figure, imshow(I2)
figure,imshow(I3)
figure,imshow(I4,I4map)
%%
% b)	Turn the RGB image to Grayscale image.
G1 = rgb2gray(I2)
figure,imshow(G1)
%%
% c)	Turn the Indexed image to Grayscale image.
G2 = ind2gray(I4,I4map);
figure,imshow(G2)
%%
% d)	Turn the Indexed image to RGB image.
rgb1 = ind2rgb(I4,I4map);
figure,imshow(rgb1)
%%
% e)	Convert the Grayscale image to a Binary image.
bw1 = imbinarize(G2);
figure,imshow(bw1)
%%
% f)	Show the inverted form of that Binary image.
figure,imshow(~bw1)
%%
% g)	Show the histogram of the Grayscale image.
figure,imhist(G2);
%%
% h)	Invert the RGB image.
inv = imcomplement(rgb1);
figure,imshow(inv)
%%
% i)	Blur the RGB image.
ww=7;
kernel = ones(ww)/ww^2;
blur1 = imfilter(rgb1,kernel);
figure,imshow(blur1)
%%
% Ques - 3
bg_black = uint8(zeros(256,256));
figure,imshow(bg_black)
%%
% Ques - 4
bg_white = uint8(255*ones(256,256));
figure,imshow(bg_white)
%%
% Ques - 5
I5 = imread('i-5.png');
imshow(I5)
G3 = rgb2gray(I5);
adj1 = imadjust(G3);
figure,imshow(adj1)
%%
% Ques - 6
I6 = imread('i-6.png');
%subplot(2,1,1)
figure,imshow(I6)
%subplot(2,1,2)
b1 = I6+75;
figure,imshow(b1)
%%
% Ques - 7 
I7 = imread('i-7.jpg');
figure,imshow(I7)
thresh = multithresh(I7,7);
valuemax = [thresh max(I7(:))]
[quant8,index] = imquantize(I7,thresh,valuemax);
figure,imshow(quant8)
