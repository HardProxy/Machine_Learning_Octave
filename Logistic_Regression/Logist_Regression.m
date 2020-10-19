function Logistic_Regression
  %Criando dados de uma reta 
 for i = 1:100,
    x(i,1) = i;
    y(i,1) = i;
    y = normrnd(y,0.05*y);
   end;
 save Dados.dat y
  % Buscando a maior probabilidade 
  alfa = 0.0001;
  theta =[0;0];
  x = [ones(100,1) x];
  for i = 1:100,
    %Maximizando a probabilidade   
    l = y*log(x*theta)+(1 + y)*log(1-x*theta);
    theta = theta + alfa*(1/100)*transpose(x)*(y - x*theta);
    iteration(i,1) = i;
    iteration(1,i) = l;
   end;
   save Iteration.dat iteration
   save Theta.dat theta 
   endfunction;
    