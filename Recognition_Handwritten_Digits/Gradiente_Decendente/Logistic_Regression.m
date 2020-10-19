function Logistic_Regression
  
  % - Loading de dados
  printf("Loading Data ... \n");
  Tudo_Images = loadMNISTImages("train-images.idx3-ubyte"); 
  Tudo_Labels = loadMNISTLabels("train-labels.idx1-ubyte");
  
  % - Separando Teste e Treino
  printf("Splitting Data ... \n ");
  Image_Matrix = Tudo_Images(:,1:5000); 
  Image_Labels = Tudo_Labels(1:5000,1);
  
  Test_Matrix = Tudo_Images(:,59001:end);
  Test_Labels = Tudo_Labels(59001:end,1);
  
  % - Par�metros necess�rios para a implementa��o
  tam_Image = size(Image_Matrix); 
  tam_Labels = size(Image_Labels);
  
  printf("Choosing Parameters ...\n");
  alfa = 0.001; %Passo
  theta = zeros(tam_Image(1,1) + 1, 1 );
  w = zeros( 10, tam_Image(1,1) + 1);
  lambda = 0.001; %Regularizador
  
  printf("Applying One VS All ... \n");
  % - One VS All
  for b = 0:9,
   printf("%d\n",b);
    % - Separa��o de Classifica��es   
   Pos_Class = find(Image_Labels == b);%Classe de elementos classificados como B 
   
   Neg_Class = find(Image_Labels != b);%Classe de elementos classificados com outros valores diferentes de B
   
    % - Gradiente decendente 
   theta = Grad_Recognition( alfa, lambda, Image_Matrix', Image_Labels, Pos_Class, Neg_Class, b);
      
    % � fundamental a implementa��o de outras derivadas
    % parciais de maneira que o gradiente seja disposto em rela��o a tais derivadas( Pela defini��o do operador 
    % gradiente). 
    w(b+1,:) = theta;
  endfor;  
  
  %% __ Teste __ %%
  printf("Releasing Predictions ... ");
  %% - Previs�es
  
  
  %% - Out of sample
  m = size(Test_Matrix,2);
  pevisao = zeros(m,1);
  
  Test_Matrix = [ones(m,1) Test_Matrix'];
  
  y = round( Logistic_Function(Test_Matrix, w'));
  [output,previsao] = max(y,[],2);
   
  %% - In sample 
  n = size(Image_Matrix,2);
  Image_Matrix = [ ones(n,1) Image_Matrix'];
  
  z = round( Logistic_Function(Image_Matrix , w'));
  [output, previsao_In] = max(z,[],2);
  %% - Resultados
  
  
  printf("\n Accuracy in Samples : %f \n", mean(double(previsao_In -1 == Image_Labels))*100);
  printf("\n Accuracy out of Sample : %f \n",mean(double(previsao-1 == Test_Labels))*100);
  
  endfunction;