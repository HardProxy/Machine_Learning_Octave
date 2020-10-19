imagem = imread("praca.jpg");

c1 = 20;
b = 50;

image_Linear = uint8(c1 * double(imagem) + b);

imagem_Log = uint8(c1*log(double(imagem)));
imshow(imagem_Log);