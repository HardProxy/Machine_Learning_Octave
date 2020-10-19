function  Create_Graphic
  
  load "Data.dat";
  load "Theta_Vale_Multi_Class.dat";
  
  class1 = (dados(:,3) == 1);
  class2 = (dados(:,3) == 2);
  class3 = (dados(:,3) == 3);  
  
  x = [0,30];
  z1 = -(1./w(3,1)).*(w(2,1).*x + w(1,1));
  z2 = -(1./w(3,2)).*(w(2,2).*x + w(1,2));
  
  imagem = figure();
  plot(dados(class1,1),dados(class1,2),"ko","Color","r");
  hold  on
  plot(dados(class2,1),dados(class2,2),"kx","Color","b");
  plot(dados(class3,1),dados(class3,2),"k*"); 
  plot(x,z1);
  plot(x,z2);
  xlabel("X");
  ylabel("Y");
  print(imagem,"Amostra_Multi_Class.jpg")
endfunction;