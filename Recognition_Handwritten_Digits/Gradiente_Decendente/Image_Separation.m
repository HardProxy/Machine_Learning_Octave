function Image_Separation
  Image_Matrix = loadMNISTImages("train-images.idx3-ubyte");
  Image_Label = loadMNISTLabels("train-labels.idx1-ubyte");
  
  tam = size(Image_Label);
  Separado = zeros(28,28);
  for c =  1:100,
  for a = 0:27,
    Separado(1:28, a+1 ) = Image_Matrix( (1 + 28*a) : (28 + 28*a), c );
  endfor;
  save(sprintf("File_%d.dat",c),"Separado");
endfor;

endfunction;