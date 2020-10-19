  function teste_Lambda
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

  for c = lambda,
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
  Custo(find(lambda == c)) =  Cost_Function_Logistic( h, y, c,w);
  endfor;

  imagem = figure();
  plot(lambda,Custo);
  title("Custo em Funcao do Constante de Regularizacao");
  xlabel("lambda");
  ylabel("Custo");
  print(imagem,"Validation_Lambda_Class_9.jpg");

  endfunction;