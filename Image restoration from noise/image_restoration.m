%% i. Geometric Mean filter 
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
n = 3;
F = exp(imfilter(log(I), ones(n, n), 'replicate')).^(1/(n*n));
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply noise');
subplot(2, 3, 3), imshow(F), title('GMF');

%% ii. Harmonic Mean filter
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
n = 3;
SF = (n*n)./imfilter(1./(I+eps), ones(n, n),'replicate');
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(SF), title('HMF');

%% iii. Contra-harmonic Mean filter
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
n = 3;
order = 1;
SF = imfilter(I.^(order+1), ones(n, n),'replicate')./(imfilter(I.^(order), ones(n, n),'replicate')+eps);
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(SF), title('CHMF');

%% i. Median filter 
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
B = ordfilt2(I,5,ones(3,3));
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(B), title('Median Filter');

%% ii. Maximum filter
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
B = ordfilt2(I,9,ones(3,3));
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(B), title('Maximum Filter');

%% iii. Minimum filter
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
B = ordfilt2(I,1,ones(3,3));
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(B), title('Minimum Filter');

%% iv. Midpoint filter
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
min = ordfilt2(I,1,ones(3,3));
max = ordfilt2(I,9,ones(3,3));
B = imlincomb(0.5,min,0.5,max);
midpointimage = B;
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(B), title('Midpoint Filter');

%% v. Alpha-trimmed filter 
img = imread('Picture1.png');
j = imnoise(img, "gaussian");
I = rgb2gray(j);
I = im2double(I);
n = 3;
d = 2;
w = ones(n, n)/((n*n)-d);
B = imfilter(I, w,'replicate', 'same');
subplot(2, 3, 1), imshow(img), title('Original Image');
subplot(2, 3, 2), imshow(j), title('After apply gaussian noise');
subplot(2, 3, 3), imshow(B), title('Alpha-trimmed Filter');
