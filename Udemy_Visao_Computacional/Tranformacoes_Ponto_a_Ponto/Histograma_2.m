imagem_Rgb = imread("praca.jpg");

imagem_Gray = rgb2gray(imagem_Rgb);
%Redistribui os valores dos niveis de cinza, normaliza a imagem
im_Equalizada = histeq(imagem_Gray);

subplot(2,2,1); imshow(imagem_Gray);
subplot(2,2,2); imshow(im_Equalizada);
subplot(2,2,3); imhist(imagem_Gray);
subplot(2,2,4); imhist(im_Equalizada);