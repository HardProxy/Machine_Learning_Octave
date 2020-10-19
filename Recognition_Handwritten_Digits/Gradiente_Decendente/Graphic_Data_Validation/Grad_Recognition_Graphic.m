function w = Grad_Recognition_Graphic( alfa, lambda, Image_Matrix, Image_Labels, Pos_Class, Neg_Class, b)
  
  Num_Iteration = 1000;
  Tam_Image = size(Image_Matrix);
  
  x_0 = ones(Tam_Image(1,1),1);
  Data = [ x_0 Image_Matrix]; %Acressimo de uma coluna para representar o termo Bias
  Theta = zeros(Tam_Image(1,2),1);
  Theta_0 = 0;
  
  %Separação de Classes%
  
  Image_Labels(Pos_Class,1)  = 1;
  Image_Labels(Neg_Class,1)  = 0;
    
  %Gradiente Decendente 
  for a = 1:Num_Iteration,
    w = [Theta_0;Theta];
    
    h = Logistic_Function(Data,w);
    
    Theta_0 = Theta_0 + alfa*x_0'*(Image_Labels - h)/Tam_Image(1,1);
    
    Theta = Theta*(1 - alfa*lambda/Tam_Image(1,1)) + alfa*Image_Matrix'*(Image_Labels - h)/Tam_Image(1,1); 
    
    w = [Theta_0; Theta]; 
   endfor;
  endfunction;