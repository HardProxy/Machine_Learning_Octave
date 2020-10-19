 imagem = imread("praca.jpg");
 
 imagem_gray = rgb2gray(imagem);
 
 
 imagem_ajustada = imadjust(imagem_gray);
 subplot(2,2,1); imshow(imagem_gray);
 subplot(2,2,2); imshow(imagem_ajustada);
 subplot(2,2,3); imhist(imagem_gray);
 subplot(2,2,4); imhist(imagem_ajustada);