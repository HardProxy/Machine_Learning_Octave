function Linear_Regression_Regularization
   N = 100;
  [x y] = Create_Data_Regularization(N);
  theta = 0;
  theta_0 = 0;
  alfa = 0.0001;
  lambda = 0.0005;
  tam = size(x);
  x_0 = ones(tam(1,1), tam(1,2));
  x_cost = [x_0 x];
  for a = 1:200
    w = [theta_0; theta];
    %Gradiente decendente para x_0
    theta_0 = theta_0 + alfa*(1/N)*x_0'*(y-x_cost*w);
    %Gradiente decendente para x_1 ... x_n
    theta = theta*(1 - alfa*(lambda/N)) + alfa*(1/N)*x'*(y - x_cost*w);
    %Função Custo de todo a amostra
    j = Cost_Function_Linear(w,x_cost,y,lambda);
    Iteration(a,1) = a;
    Iteration(a,2) = j;
  end;
  data = [x y];
  save Theta_Valeu_Reg.dat w;
  save Data_Reg.dat data;
  save Iteration_data.dat Iteration;
  
  endfunction;