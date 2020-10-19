function l = Cost_Function_Logistic(h,y,lambda,theta)
  tam = size(h);
  l = double(-(y'*log(h) + (1-y)'*log(1-h))/(2*tam(1,1)) + (lambda*theta'*theta)/(2*tam(1,1)));
  endfunction;