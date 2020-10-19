function Graphic_Reg
  load "Data_Reg.dat";
  load "Theta_Valeu_Reg.dat";
  imagem = figure();
  plot(data(:,1),data(:,2),"kx","MarkerSize",5);
  hold on
  xlabel("X");
  ylabel("Y");
  X = [-2,102];
  Z = (w(2,1).*X + w(1,1));
  plot(X,Z);
  hold off
  title("Linear Regression Regularization");
  print(imagem,"Graphic_Regularization.jpg");
  
  
  endfunction;