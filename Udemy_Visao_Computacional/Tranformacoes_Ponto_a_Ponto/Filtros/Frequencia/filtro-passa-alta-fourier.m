I = im2double(imread('rice.jpg'));
I = rgb2gray(I);
I_dft = fft2(I);

[M, N] = size(I);
dist = distmatrix(M, N);

H = ones(M, N);
radius = 30;
ind = dist <= radius;
H(ind) = 0;

a = 1; b = 1;
Hd = double(a + (b .* H));

DFT_filt = Hd .* I_dft;
I2 = real(ifft2(DFT_filt));

subplot(1,3,1); imshow(I_dft);
subplot(1,3,2); imshow(fftshift(H));
subplot(1,3,3); imshow(fftshift(DFT_filt));
figure;
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(I2);