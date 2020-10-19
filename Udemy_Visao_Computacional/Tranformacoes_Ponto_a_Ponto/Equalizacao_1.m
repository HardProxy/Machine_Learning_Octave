imagem = imread("praca.jpg");

%Equalização será feita de maneira independente sem que haja 
%grandes modificaçõoes no histograma da imagem

imagem_gray = rgb2gray(imagem);

imagem_eq_Constras_Limitado = adapthisteq(imagem_gray);

subplot(2,2,1); imshow(imagem_gray);
subplot(2,2,2); imshow(imagem_eq_Constras_Limitado);
subplot(2,2,3); imhist(imagem_gray);
subplot(2,2,4); imhist(imagem_eq_Constras_Limitado);

