im1 = imread('rice.jpg');
mascara = fspecial('laplacian', 0.1);
im2 = imfilter(im1, mascara);
im3 = im1 - im2;

im2 = double(im2);
im2= im2/max(im2(:));
imagem = figure();

subplot(1,1,1);imshow(im2);

print(imagem, "Bordas.jpg");