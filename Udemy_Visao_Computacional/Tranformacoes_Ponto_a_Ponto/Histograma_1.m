imagem_Rgb = imread("teste.png");

imagem_Gray = rgb2gray(imagem_Rgb);

[valor, bin] = imhist(imagem_Gray);

subplot(1,3,1); imshow(imagem_Gray);
subplot(1,3,2); imhist(imagem_Gray);
subplot(1,3,3); bar(bin,valor);
imwrite(imagem_Gray,"teste_1.png");