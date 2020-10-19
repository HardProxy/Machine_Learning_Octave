im1 = imread('head.png');
im1 = imnoise(im1, 'salt & pepper', 0.1);

mascara1 = fspecial('average', [5 5]);
im2 = imfilter(im1, mascara1);

mascara2 = fspecial('disk', 5);
im3 = imfilter(im1, mascara2);

subplot(1,3,1); imshow(im1);
subplot(1,3,2); imshow(im2);
subplot(1,3,3); imshow(im3); 