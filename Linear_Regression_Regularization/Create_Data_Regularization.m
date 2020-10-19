function [x y] = Create_Data_Regularization(N)
  for a = 1:N,
    x(a,1) = a;
    y(a,1) = a;
  endfor;
  y = normrnd(y,13);
  endfunction;
  