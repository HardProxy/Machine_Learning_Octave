I = imread('rice.jpg');
I = rgb2gray(I);
Id = im2double(I);

I_dft = fft2(Id);
[M, N] = size(I);

dist = distmatrix(M, N);

H = zeros(M, N);
radius = 35;
ind = dist <= radius;
H(ind) = 1;
Hd = double(H);

DFT_filt = Hd .* I_dft;
I2 = real(ifft2(DFT_filt));

subplot(1,3,1); imshow(I_dft);
subplot(1,3,2); imshow(fftshift(H));
subplot(1,3,3); imshow(fftshift(DFT_filt));
figure;
subplot(1,2,1); imshow(Id);
subplot(1,2,2); imshow(I2);