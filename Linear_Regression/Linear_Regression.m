function Linear_Regression
	%Variando valores em 5% em valores randômico 
	for i = 1:100,
		x(i,1)= i;
		y(i,1) = i;
		y = normrnd(y,0.05*y);
	end;	
	
	save Reta.dat y	

	%Considerando que tal função é linear , temos que h(x) = b + a*x
	alfa = 0.000001; %passo
	theta = [0;0];
	x = [ones(100,1) x];	 
	for i = 1:100 
	j = (1/200)*transpose(x*theta - y)*(x*theta - y);
	theta = theta + alfa*transpose(x)*( y - x*theta);
    	Iteration(i,1) = i;
	Iteration(i,2) = j;	
	end;
	
	save Theta_Value.dat theta 
	save Iteration_Data.dat Iteration

endfunction
