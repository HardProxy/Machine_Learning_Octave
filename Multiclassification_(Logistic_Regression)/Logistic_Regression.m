function w = Logistic_Regression(data,y)    
    %Declaração de Constantes e Funções 
    alfa = 0.001;
    w = [1 ; 1; 1];
    l = 0;
    data = [ ones(size(y)) data];
    %Método de Iteração
    for i = 1:2000000,
      h = 1./(1 + exp(-data*w)); %Sigmoid
      l = -(y'*log(h) + (1-y)'*log(1 - h))/30; %Função de custo
      w = w + (alfa*data'*(y - h))/30;
    endfor;
end;