%QUESTION 1
img1 = imread('i4.png');
ref = imread('i5.png');

res1 = imhistmatch(img1,ref);

figure,imhist(img1);title('Histogram of original image');
figure,imhist(ref);title('Histogram of referenced image');
figure,imhist(res1);title('Histogram of output image');

%%
%QUESTION 2
img2 = imread('i.png');
target = 256:-4:4;
heq1 = histeq(img2,target);
figure,imhist(img2);title('Original Image')
figure,imhist(heq1);title('Equalized Image')

%%
%QUESTION 3
img3 = imread('i2.png');
noise1 = imnoise(img3,'salt & pepper',0.035);

minf = @(x) min(x(:));
min_image = nlfilter(noise1,[2,2],minf);

maxf = @(x) max(x(:));
max_image = nlfilter(noise1,[2,2],maxf);

subplot(2,2,1);imshow(img3);title('Original Image');
subplot(2,2,2);imshow(noise1);title('Noise Image');
subplot(2,2,3);imshow(min_image);title('Min Filterd Image');
subplot(2,2,4);imshow(max_image);title('Max Filterd Image');

%%
%QUESTION 4
noise2 = imnoise(img3,'gaussian',0.01);

guss1 =  imgaussfilt(noise2,2);

subplot(2,2,1);imshow(img3);title('Original Image');
subplot(2,2,2);imshow(noise2);title('Noise Image');
subplot(2,2,3);imshow(guss1);title('Gaussian Filterd Image');
%%
%QUESTION 5
img4 = imread('i3.png');
guss2 = imnoise(img4,'salt & pepper');
box = imboxfilt(guss2);

gray1 = rgb2gray(guss2);
med = medfilt2(gray1,[3,3]);

h = fspecial('average',3);
avg = imfilter(gray1,h);

subplot(2,3,1);imshow(img4);title('Original Image');
subplot(2,3,2);imshow(guss2);title('Noise Image');
subplot(2,3,3);imshow(gray1);title('Noised Grayscale Image');
subplot(2,3,4);imshow(box);title('Box filtered Image');
subplot(2,3,5);imshow(med);title('Median filtered Image');
subplot(2,3,6);imshow(avg);title('Average filtered Image');




