imagem_Rgb = imread("praca.jpg");

imagem_Gray = rgb2gray(imagem_Rgb);

imagem_Scale_1 = imresize(imagem_Gray,0.05);
imagem_Scale_2 = imresize(imagem_Gray,[200,200],"bicubic");

subplot(1,3,1); imshow(imagem_Gray);
subplot(1,3,2); imshow(imagem_Scale_1);
subplot(1,3,3); imshow(imagem_Scale_2); 