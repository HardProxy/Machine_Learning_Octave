im1 = imread('head.png');
im2 = imnoise(im1, 'salt & pepper', 0.1);

mascara = fspecial('gaussian', [5 5], 1.5);
im3 = imfilter(im2, mascara);

subplot(1,3,1); imshow(im1);
subplot(1,3,2);imshow(im2);
subplot(1,3,3); imshow(im3); 