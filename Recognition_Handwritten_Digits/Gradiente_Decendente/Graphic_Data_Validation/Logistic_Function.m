function h = Logistic_Function(x,w)
  
  h = 1./(1+exp(-x*w));
  
endfunction;
