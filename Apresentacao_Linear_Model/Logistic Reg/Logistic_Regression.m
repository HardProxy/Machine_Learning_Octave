function Logistic_Regression    
    load("Data.dat")
    load("Classification.dat")
    %Declaração de Constantes e Funções 
    alfa = 0.001;
    w = [1 ; 1; 1];
    l = 0;
    data = [ ones(100,1) data];
    %Método de Iteração
    for i = 1:20000,
      h = 1./(1 + exp(-data*w)); %Sigmoid
      l = -(y'*log(h) + (1-y)'*log(1 - h))/100; %Função de custo
      w = w + alfa*data'*(y - h)/100;
      iteration(i,1) = i/100;
      iteration(i,2) = l;
    end;
       p = round(1./(1+exp(-data*w)));
       acertos = mean( double(p == y)*100)
      save Iteration.dat iteration;
      save Theta.dat w;
      save Porcentagem_Acerto.dat acertos;
      end;