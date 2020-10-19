function Logistic_Regression
  N = 100;
  [x1 x2 y] = Create_Data_Logistic_Regularization(N);
  alfa = 0.001;
  theta_0 = 1;
  theta = [1;1];
  x = [x1 x2];
  x0 = ones(N,1);
  data = [x0 x1 x2];
  lambda = 0.1;
  
  for a = 1:20000,
   w = [theta_0;theta];
   
   h = Logistic_Function(data,w);
   
   theta_0 = theta_0 + alfa*(x0)'*(y - h)/N;
   
   theta = theta*(1 - alfa*(lambda/N)) + alfa*x'*(y - h)/N;
   
   %Como se tem apenas 2 par�metros foi necess�rio apresentar somente a derivada parcial em rela��o ao 
   % ao par�metro theta_1. Caso tiv�ssemos mais par�metros � fundamental a implementa��o de outras derivadas
   % parciais de maneira que o gradiente seja disposto em rela��o a tais derivadas( Pela defini��o do operador 
   % gradiente). 
   
   l = Cost_Function_Logistic( h, y, lambda,w);
   Iteration(a,1) = a;
   Iteration(a,2) = l;
   w = [theta_0;theta];
  endfor;
   p = round(Logistic_Function(data,w));
   acertos = mean( double(y == p)*100 )
  save Cost.dat Iteration;
  save Theta_Valeu_Regularization.dat w;
  plot(lambda,Custo);
  
  endfunction;