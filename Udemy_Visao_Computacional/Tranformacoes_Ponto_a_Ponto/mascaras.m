imagem = imread("praca.jpg");

imagem_cinza = rgb2gray(imagem);

im1 = imagem_cinza > 128;

im2 = imagem_cinza > 128 & imagem_cinza < 170;

subplot(2,2,1); imshow(imagem);
subplot(2,2,2); imshow(imagem_cinza);
subplot(2,2,3); imshow(im1);
subplot(2,2,4); imshow(im2); 