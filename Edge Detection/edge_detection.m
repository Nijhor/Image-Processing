%% a) Local/Regional Thresholding 
I = midpointimage;
T = graythresh(I);
a = im2bw(I, T);
subplot(2, 2, 1), imshow(I), title('Image from problem 3');
subplot(2, 2, 2), imshow(a), title('Local/Regional Thresholding');

%% b) Global Thresholding
I = midpointimage;
BW = imbinarize(I,'global');
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(BW);title('Global Thresholding');

%% c) Variable Thresholding
I = midpointimage;
[r c]=size (I);
output=zeros (r, c);
starts=floor (1:c/10:c);
ends = starts (2:length(starts));
ends=[ends c];
figure, imshow(I);
hold on;
for i = 1:10
    plot([ends(i) ends(i)], [1,r], 'w');
end
for i = 1:10
    temp = img(:, starts(i):ends(i));
    out(:, starts(i):ends(i))=im2bw(temp,graythresh(temp));
    plot([ends(i) ends(i)], [1,r], 'w');
end
subplot(2, 2, 1), imshow(I), title('Original Image');
subplot(2, 2, 2), imshow(out), title('Variable Thresholding Image');

%% d) Dynamic/Adaptive Thresholding
I = midpointimage;
BW = imbinarize(I,'adaptive');
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(BW);title('Dynamic/Adaptive Thresholding');

%% a) 
img = midpointimage;
sobel = edge(img, 'Sobel');
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(sobel);title('sobel filtered Image');

%% b) 
img_canny=edge(img, 'Canny');
subplot(2,2,1);imshow(img);title('Origial Image'); 
subplot(2,2,2);imshow(img_canny);title('Canny Edge');

%% c) 
prewitt = edge(img, 'Prewitt');
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(prewitt);title('prewitt filtered Image');


%% c) 
img = midpointimage;
img = imcrop(img, [100 150 150 150]);
prewitt = bwareaopen(imerode(imfill(imclose(edge(img, 'Sobel'), strel('line', 3, 0)), 'holes'),strel(ones(3,3))),1500);

subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(prewitt);title('prewitt filtered Image');
