
clear; close all; clc;
Z = imread('tiger.jpg'); % Read original image

g = [1,4,6,4,1; 4,16,4,16,4; 6,24,36,24,6; 4,16,24,16,4; 1,4,6,4,1];
g = g / 256;
Z0 = imfilter(Z, g); % Filtered image (0 scale)

Z1 = imresize(Z0, [128,128]);
Z2 = imresize(Z0, [64,64]);
Z3 = imresize(Z0, [32,32]);
Z4 = imresize(Z0, [16,16]);
Z5 = imresize(Z0, [8,8]);

% Channel separation
r = Z0(:,:,1); g = Z0(:,:,2); b = Z0(:,:,3);
ZL = rgb2gray(Z0);

% RG/BY channel calculation
RR = double(r) - ((double(g) + double(b))/2);
GG = double(g) - ((double(r) + double(b))/2);
BB = double(b) - ((double(r) + double(g))/2);
YY = (double(r) + double(g)) - 2 * (abs(double(r) - double(g)) + double(b));
RG = abs(RR - GG);
BY = abs(BB - YY);

% Gabor orientation features
ZL00 = mygaborfilter(double(ZL), 0);
ZL45 = mygaborfilter(double(ZL), 45);
ZL90 = mygaborfilter(double(ZL), 90);
ZL135 = mygaborfilter(double(ZL), 135);

% Further feature fusion and normalization steps follow...
