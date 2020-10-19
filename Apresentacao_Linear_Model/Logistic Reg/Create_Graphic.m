function Create_Graphic
  load "Data.dat";
  load "Classification.dat";
  load "Iteration.dat";
  load "Porcentagem_Acerto.dat";
  load "Theta.dat";
  teste = figure();
  pos = find(y == 1);
  neg = find(y == 0);
  plot(data(pos,1),data(pos,2),"kx","MarkerSize",5);
  hold on
  plot (data(neg,1), data(neg,2),"ko","MarkerSize",5,"Color","r");
  xlabel("X");
  ylabel("Y");
  x = [-2,102];
  z = -(1./w(3,1)).*(w(2,1).*x + w(1,1));
  plot(x,z);
  hold off
  title("Dados amostrais(Accuracy = 100%)");
  print(teste,"Graphic_General.jpg");  
  end;