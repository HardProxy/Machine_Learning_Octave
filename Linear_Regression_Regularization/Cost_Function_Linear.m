function j = Cost_Function_Linear(theta,x,y,lambda)
  tam = size(x);
  tam_theta = size(theta);
  j = (1/(2*tam(1,1)))*(x*theta-y)'*(x*theta-y) + lambda*theta'*theta/(2*tam_theta(1,1)) ;
end;