im1 = imread('head.png');
im2 = imnoise(im1, 'salt & pepper', 0.1);
im3 = medfilt2(im2);

subplot(1,3,1); imshow(im1);
subplot(1,3,2); imshow(im2);
subplot(1,3,3); imshow(im3);