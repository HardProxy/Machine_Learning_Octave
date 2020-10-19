function Logistic_Regression
  %Criando dados de uma reta 
 for i = 1:100,
    l(i,1) = i;
    u(i,1) = i;
    u = normrnd(u, 0.1);
    if mod(i,2) == 0,
    y(i,1) = 1;
    else
    y(i,1) = 0;
    end;
   end;
   x = [l,u];
   z = [x, y];
 save Dados.dat z
  % Buscando a maior probabilidade 
  alfa = 0.000001;
  theta =[0;0;0];
  x = [ones(100,1) x];
  tira = ones(100,1);
  
  for j = 1:100,
    %Maximizando a probabilidade de h(w) ser a target function
    h = x*theta;
    for i = 1:100,
    l =y(i,1)*log(1/(1+exp(-h(i,1))))+(1-y(i,1))*log(1-exp(-h(i,1)));
    a(i,1) = 1/(1+exp(-h(i,1))); 
    end;
    
    theta = theta + alfa*x'*(y - a);  
    iteration(j,1) = j;
    iteration(j,2) = l;
   end;
   save Iteration.dat iteration
   save Theta.dat theta 
   endfunction;
    