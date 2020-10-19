im1 =imread('head.png');

mascara1 = fspecial('average', [3 3]);
mascara2 = fspecial('disk', 15);

im2 = imfilter(im1, mascara1);
im3 = imfilter(im1, mascara2);

subplot(1,3,1); imshow(im1);
subplot(1,3,2); imshow(im2);
subplot(1,3,3); imshow(im3);