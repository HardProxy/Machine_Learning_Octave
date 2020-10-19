function Create_Data_Mult_Class
  
  %Criar reta
  
  for a = 1:10,
    
    x1(a,1) = a;
    y1(a,1) = -a + 10;
    
  endfor;
  
  y1  = normrnd(y1,3);
  
  for a = 5:15,
    
    x2(a-4,1) = a;
    y2(a-4,1) = -a + 30; 
  endfor;
  
  y2 = normrnd(y2,3);
  
  for a = 10:20,
    x3(a-9,1) = a;
    y3(a-9,1) = -a + 50;
  endfor;
  
  y3 = normrnd(y3,3);
  
  class1 = [ x1 y1 ones(size(x1)) ];
  class2 = [ x2 y2 2*ones(size(x2)) ];
  class3 = [ x3 y3 3*ones(size(x3)) ];
  
  dados = [class1;class2;class3];
  save Data.dat dados;
  endfunction;