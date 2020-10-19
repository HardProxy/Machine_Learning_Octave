function Linear_Regression
	%Variando valores em 5% em valores randÃ´mico 
	for i = 1:100,
		x(i,1)= i;
		y(i,1) = i;
		y = normrnd(y,0.05*5);
	end;	
	
	save Reta.dat y	

	%Considerando que tal funÃ§Ã£o Ã© linear , temos que h(x) = b + a*x
	%passo
  alfa = 0.0001;
  %Valores Iniciais
	theta = [0;0]; 
	x = [ones(100,1) x];	 
	for i = 1:100 
  %Função Custo
	j = (1/100)*transpose(x*theta - y)*(x*theta - y);%( Distância )
	%Método do  gradiente decrescente, buscando valores do coenficiente que melhor aproximan a reta
  theta = theta + alfa*(2/100)*transpose(x)*( y - x*theta); 
  Iteration(i,1) = i;
	Iteration(i,2) = j;	
	end;
  
	save Theta_Value.dat theta 
	save Iteration_Data.dat Iteration
  %Método Analítico
  theta1 = pinv(x)*y;
  save Theta_Value_Dagger.dat theta1
  
endfunction
