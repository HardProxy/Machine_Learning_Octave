mask = ones(3,3)/4;

im1 = imread('head.png');
im2 = imfilter(im1, mask);

subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(im2);