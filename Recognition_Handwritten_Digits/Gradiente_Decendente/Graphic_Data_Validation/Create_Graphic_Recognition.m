function Create_Graphic_Recognition
 %Loading de Dados 
 Tudo_Images = loadMNISTImages("train-images.idx3-ubyte");
 Tudo_Labels = loadMNISTLabels("train-labels.idx1-ubyte");
 
 %Criacao de Graficos para verificacao de resultados
  pontos = 20;
 Resultado = zeros(2,pontos+1);
 
    for a = 0:pontos,
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

 
   b = 4;
   
   Pos_Class = find(Image_Labels == b);
   Neg_Class = find(Image_Labels != b);
   
   theta = Grad_Recognition_Graphic(alfa,lambda,Image_Matrix',Image_Labels,Pos_Class,Neg_Class,b);
   
   %Com o mesmo theta calcular a funcao custo para diferentes numeros de treino e teste
   x_0 = ones(tam_Image(1,2),1);
   
   Data_IN = [x_0 Image_Matrix'];
   Data_Out = [x_0 Test_Images'];
   h_in = Logistic_Function(Data_IN,theta);
   h_out = Logistic_Function(Data_Out,theta);
   
   jCost_IN = Cost_Function_Logistic(h_in,Image_Labels,lambda,theta);
   jCost_Out = Cost_Function_Logistic(h_out,Test_Labels,lambda,theta);
   
   Resultado(:,a+1) = [jCost_IN;jCost_Out];
   endfor;
   %Construcao do grafico
  Dominio = 0:pontos;
  imagem = figure();
  plot(Dominio,Resultado(1,:),"ko","Color","r");
  hold on 
  plot(Dominio,Resultado(2,:),"kx","Color","b");
  xlabel("Data size");
  ylabel("Cost (Error)");
  legend("In Sample","Out Sample");
  title("Error em Funcao da Quantidade de Dados");
  
  print(imagem,"Graphic_Cost_size_Class_4.jpg");
  
  endfunction;