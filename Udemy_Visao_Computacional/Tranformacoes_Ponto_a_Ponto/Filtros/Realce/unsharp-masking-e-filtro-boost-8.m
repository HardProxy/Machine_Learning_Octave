im1 = imread('rice.jpg');
mascara = fspecial('average', [3 3]);
im2 = imfilter(im1, mascara);

gmask = im1 - im2;

im3 = im1 + 1* gmask;

im4 = im1+ 3.5 * gmask;

subplot(1,3,1); imshow(im1);
subplot(1,3,2); imshow(im3);
subplot(1,3,3); imshow(im4);