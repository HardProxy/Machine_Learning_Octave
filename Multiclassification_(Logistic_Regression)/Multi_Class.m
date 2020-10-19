function Multi_Class
  Create_Data_Mult_Class;
  load "Data.dat";
  
  %Iterações para classificação em relação à primeira classe
  %iterações para classificação em relação à segunda classe 
  
  class1 = (dados(:,3) == 1);
  class2 = (dados(:,3) == 2);
  class3 = (dados(:,3) == 3);
  tentativa = dados;
  x = dados(:,1);
  y = dados(:,2);
  implementacao = [x,y];
  %1 - para a primeira parte 
  tentativa(class1,3) = 1;
  tentativa(class2,3) = 0;
  tentativa(class3,3) = 0;
  w1 = Logistic_Regression(implementacao,tentativa(:,3));
  
  tentativa = dados;
  %2 - para a segunda parte
  tentativa(class1,3) = 0;
  tentativa(class2,3) = 0;
  tentativa(class3,3) = 1;
  
  w2 = Logistic_Regression(implementacao,tentativa(:,3));
   
  w = [w1,w2]; 
   
  save Theta_Vale_Multi_Class.dat w;
  
  Create_Graphic;
  
  endfunction;