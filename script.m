%%
%load image
close all;
clear;
threshold = 50;
%hiddenIm = imread('fourSquares.tif');
%hiddenIm = imread('stripes.tiff');
hiddenIm = imread('spiral.tiff');
hiddenIm = rgb2gray(hiddenIm(:,:,1:3));
hiddenIm((hiddenIm > 50)) = 255;
hiddenIm((hiddenIm <= 50)) = 0;
[r,c] = size(hiddenIm);
%figure;imshow(redSquares);
figure;imshow(hiddenIm);
maskedIm = buildMaskedIm(hiddenIm,0);
figure;imshow(maskedIm);
testImage = maskedIm;
testImage(:,:,2) = zeros(r,c);
testImage(:,:,3) = zeros(r,c);

figure;imshow(testImage);

%d = colorDist(RedStripes,RedStripes);
%%
p = [200 100 100];
f = 50;
pp = project_point(p,f);    
disp(pp);