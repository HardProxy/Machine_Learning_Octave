function [x1 x2 y] = Create_Data_Logistic_Regularization(N)
  for a= 1:N,
    x1(a,1) = a;
    x2(a,1) = a;
  endfor;
  x2 = normrnd(x2,10);
  
  for a = 1:N,
    if x2(a,1) > a,
      y(a,1) = 1;
    else
      y(a,1) = 0;
    endif;
  endfor;
  
  dados = [x1 x2];
  save Data.dat dados;
  save Classification.dat y;
  
  endfunction;