function Lambda
  N = 100;
  [x1 x2 y] = Create_Data_Logistic_Regularization(N);
  alfa = 0.001;
  theta_0 = 1;
  theta = [1;1];
  x = [x1 x2];
  x0 = ones(N,1);
  data = [x0 x1 x2];
  n_it = 2000;
  lambda = [0,0.1,0.4, 0.5,0.6,0.7,0.8,0.9,1,2,3,4];
  Iteration = zeros(n_it,2);
  Custo = zeros(size(lambda,1));
  for b = lambda
  for a = 1:n_it,
   w = [theta_0;theta];
   
   h = Logistic_Function(data,w);
   
   theta_0 = theta_0 + alfa*(x0)'*(y - h)/N;
   
   theta = theta*(1 - alfa*(b/N)) + alfa*x'*(y - h)/N;
   
   %Como se tem apenas 2 par�metros foi necess�rio apresentar somente a derivada parcial em rela��o ao 
   % ao par�metro theta_1. Caso tiv�ssemos mais par�metros � fundamental a implementa��o de outras derivadas
   % parciais de maneira que o gradiente seja disposto em rela��o a tais derivadas( Pela defini��o do operador 
   % gradiente). 
   
   l = Cost_Function_Logistic( h, y, b,w);
   Iteration(a,1) = a;
   Iteration(a,2) = l;
   w = [theta_0;theta];
  endfor;
     Custo(find(b == lambda)) = Cost_Function_Logistic( h, y, b,w);
  end;
  p = round(Logistic_Function(data,w));
   acertos = mean( double(y == p)*100 )
  save Cost.dat Iteration;
  save Theta_Valeu_Regularization.dat w;
  imagem = figure();
  plot(lambda,Custo);
  print(imagem,"Lambda.jpg");
    endfunction;