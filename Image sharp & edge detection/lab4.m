%Ques 1 (a)
I1 = imread('tumor.png');
shrp1 = imsharpen(I1,'Radius',2,'Amount',1);
subplot(1,2,1);imshow(I1);title('Input Image')
subplot(1,2,2);imshow(shrp1);title('Unsharp masked Image')
%%
%(b)
laplacianKernel = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
deltaFunction = [0, 0, 0; 0, 1, 0; 0, 0, 0];
scaleFactor = 1;
% Whatever... From 0 to +255, including fractional numbers like 0.5
kernel = laplacianKernel + scaleFactor * deltaFunction;
% Normalize so that the mean intensity doesn't change.
kernel = kernel / sum(kernel(:))
% Filter the image
filteredImage = imfilter(I1, kernel);
subplot(1,2,1);imshow(I1);title('Input Image')
subplot(1,2,2);imshow(filteredImage);title('High Boost Filtered Image')

%%
%Ques 2
I2=imread("Spine_CT.png");
lap=[-1 -1 -1; -1 8 -1; -1 -1 -1];
lap1=imfilter(I2,lap);
subplot(1,2,1);imshow(I2);title('Input Image')
subplot(1,2,2);imshow(lap1);title('Laplacian Filtered Image')

%%
%Ques 3
I3 = imread('Head_CT_Scan.png');

x_mask = [1 0; 0 -1];
y_mask = [0 1;-1  0];

rb1 = imfilter(I3,x_mask,'conv');
rb2 = imfilter(I3,y_mask,'conv');


add1 = imadd(rb1,rb2);

subplot(1,2,1);imshow(I3);title('Input Image')
subplot(1,2,2);imshow(add1);title('Robert-cross Image')

%%
%Ques 4

x_mask = [-1 -2 -1;0 0 0; 1 2 1];
y_mask = [-1 0 1; -2 0 2; -1 0 1];


sobel1 = imfilter(I3,x_mask,'conv');
sobel2 = imfilter(I3,y_mask,'conv');


add2=imadd(sobel1,sobel2);

subplot(1,2,1);imshow(I3);title('Input Image')
subplot(1,2,2);imshow(add2);title('Sobel Filtered Image')

%%
%Ques 5

x_mask = [-1 -1 -1;0 0 0;1 1 1];
y_mask = [-1 0 1 ; -1 0 1; -1 0 1];


pre1 = imfilter(I3,x_mask,'conv');
pre2 = imfilter(I3,y_mask,'conv');


add3 = imadd(pre1,pre2);

subplot(1,2,1);imshow(I3);title('Input Image')
subplot(1,2,2);imshow(add3);title('Prewitt Filtered Image')

%%
%Ques 6
subplot(2,2,1);imshow(I3);title('Input Image')
subplot(2,2,2);imshow(add1);title('Robert-cross Image')
subplot(2,2,3);imshow(add2);title('Sobel Filtered Image')
subplot(2,2,4);imshow(add3);title('Prewitt Filtered Image')



