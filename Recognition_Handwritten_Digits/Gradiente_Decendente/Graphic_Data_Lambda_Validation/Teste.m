  function Teste
  N = 1000;
  n_it = 1000;
  % - Loading de dados
  printf("Loading Data ... \n");
  Tudo_Images = loadMNISTImages("train-images.idx3-ubyte"); 
  Tudo_Labels = loadMNISTLabels("train-labels.idx1-ubyte");
  
  % - Separando Teste e Treino
  printf("Splitting Data ... \n");
  x= Tudo_Images(:,1:N); 
  y = Tudo_Labels(1:N,1);
  % - Par�metros necess�rios para a implementa��o
  tam_Image = size(x); 
  tam_Labels = size(y);
  
  printf("Choosing Parameters ...\n");
  alfa = 0.01; %Passo
  theta_0 = 0;
  theta = zeros(tam_Image(1,1), 1 );
  lambda = 0:0.1:5; %Regularizador
  x_0 = ones(tam_Image(1,2),1);
  Custo = zeros(size(lambda,1));

  c = 0.001;
  
  b = 9;  
  % - One VS All
   % - Separa��o de Classifica��es   
   Pos_Class = find(y == b);%Classe de elementos classificados como B 
   
   Neg_Class = find(y != b);%Classe de elementos classificados com outros valores diferentes de B
   y(Pos_Class,1)  = 1;
   y(Neg_Class,1)  = 0;
   printf("Gradient Decendent (%d) ... \n",c);
   
    % - Gradiente decendente 
  for cont = 1:n_it,
    
      w = [theta_0; theta];
       
      h = Logistic_Function([x_0 x'], w);
      
      theta_0 = theta_0 + alfa* (x_0)'*(y -h )/N;
      theta = theta*(1  - alfa*c/N) + alfa*x*(y - h)/N; 
      
      w = [theta_0; theta];
  
  endfor;
  
  Image_Matrix = Tudo_Images(:,1:N); 
  Image_Labels = Tudo_Labels(1:N,1);
  Test_Matrix = Tudo_Images(:,59900:); #100 dados de Validação
  Test_Labels = Tudo_Labels(59900:,1);
  
  %% - Out of sample
  m = size(Test_Matrix,2);
  pevisao = zeros(m,1);
  
  Test_Matrix = [ones(m,1) Test_Matrix'];
  
  y = round( Logistic_Function(Test_Matrix, w));
  [output,previsao] = max(y,[],2);
   
  %% - In sample 
  n = size(Image_Matrix,2);
  Image_Matrix = [ ones(n,1) Image_Matrix'];
  
  z = round( Logistic_Function(Image_Matrix , w));
  [output, previsao_In] = max(z,[],2);
  %% - Resultados
  printf("\n Accuracy in Samples : %f \n", mean(double(previsao_In -1 == Image_Labels))*100);
  printf("\n Accuracy out of Sample : %f \n",mean(double(previsao-1 == Test_Labels))*100);
  endfunction;