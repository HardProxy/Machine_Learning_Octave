function Graphic_Logistic_Reg

  load "Data.dat";
  load "Classification.dat";
  load "Theta_Valeu_Regularization.dat";
  
  imagem = figure();
  
  pos = find(y == 1);
  neg = find(y == 0);
  
  plot(dados(pos,1), dados(pos,2),"kx","MarkerSize",5,"Color","r");
  
  hold on
  
  plot(dados(neg,1),dados(neg,2),"ko","MarkerSize",5);
  xlabel("X");
  ylabel("Y");
  x = [-2,102];
  z = -(1./w(3,1)).*(w(2,1).*x + w(1,1));
  plot(x,z);
  hold off 
  title("Dados Amostrais (Regularização)");
  print(imagem,"Graphic_Logistic_Reg.jpg");

endfunction;
