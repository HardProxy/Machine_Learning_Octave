imagem_Rgb = imread("praca.jpg");

imagem_Gray = rgb2gray(imagem_Rgb);

imagem_Crop_1 = imcrop(imagem_Gray);
imagem_Crop_2 = imcrop(imagem_Gray,[20 20 100 100]);

subplot(1,3,1); imshow(imagem_Gray);
subplot(1,3,2); imshow(imagem_Crop_1);
subplot(1,3,3); imshow(imagem_Crop_2); 