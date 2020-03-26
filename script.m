%%
%load image
close all;
clear;
squares = imread('fourSquares.tif');
stripes = imread('stripes.tiff');
[r,c] = size(squares);
stripes = rgb2gray(stripes(:,:,1:3));

%figure;imshow(redSquares);
figure;imshow(squares);
maskedIm = buildMaskedIm(squares,0);
figure;imshow(maskedIm);
%d = colorDist(RedStripes,RedStripes);
%%
