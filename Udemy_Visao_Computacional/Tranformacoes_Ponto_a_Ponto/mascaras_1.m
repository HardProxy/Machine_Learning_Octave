imagem = imread("praca.jpg");

im_Gray = imrotate(rgb2gray(imagem),45,"bilinear");

mask_1 = im_Gray < 128;

im_1 = 0.2 * (im_Gray .* uint8(mask_1));

mask_2 = im_Gray > 200;

im_2 = 0.3 * (im_Gray .* uint8(mask_2));

im_3 = im_Gray + im_1 - im_2;


subplot(2,2,1); imshow(im_Gray);
subplot(2,2,2); imshow(im_1);
subplot(2,2,3); imshow(im_2);
subplot(2,2,4); imshow(im_3);

%%Rotação

