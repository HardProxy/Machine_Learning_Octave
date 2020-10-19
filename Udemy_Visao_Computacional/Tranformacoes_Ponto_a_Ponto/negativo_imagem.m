%% Negativo de uma imagem
%load pkg image 
imagem = imread("praca.jpg");

negativo = imcomplement(imagem);

%subplot

subplot(1,2,1); imshow(imagem);
subplot(1,2,2); imshow(negativo);