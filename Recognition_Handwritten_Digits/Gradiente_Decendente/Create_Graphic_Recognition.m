function Create_Graphic_Recognition
 %Loading de Dados 
 Tudo_Images = loadMNISTImages("train-images.idx3-ubyte");
 Tudo_Labels = loadMNISTLabels("train-labels.idx1-ubyte");
 
 %Criacao de Graficos para verificacao de resultados
 for a = 0:1000,
    
 % Separacao entre Treino e Validation
 
 %Treino
 Image_Matrix = Tudo_Images(:,9 : 10 + a*50);
 Image_Labels = Tudo_Labels(9: 10 + a*50,1);
 
 %Validation
 Test_Images = Tudo_Images(:, 10000 : 10001 + a*50 );
 Test_Labels = Tudo_Labels(10000 : 10001 + a*50,1);
 
 %Parametros necessarios para a implementacao
 tam_Image = size(Image_Matrix);
 tam_Labels = size(Image_Labels);
 alfa = 0.001;
 theta = zeros(tam_Image(1,1) + 1,1);
 lambda = 0.1;
 
 for b = 0:9,
   
   Pos_Class = find(Image_Labels == b);
   Neg_Class = find(Image_Labels != b);
   
   theta = Grad_Recognition(alfa,lambda,Image_Matrix',Image_Labels,Pos_Class,Neg_Class,b,a);
   x_0 = ones(tam_Image(1,2),1);
   data = [x_0 Test_Images'];
   
   h = Logistic_Function(data,theta);
   jCost = Cost_Function_Logistic(h,Test_Labels,lambda,theta)
   save(sprintf("Cost_OUT_Class_%d_Point_%d.dat",b,a),"jCost");
   
 endfor;

 endfor;
  
  endfunction;