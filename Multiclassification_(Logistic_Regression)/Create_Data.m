function Create_Data
  
  theta = linspace(0, 2*pi, 360);
  
  x1 = 10 + cos(theta);
  y1 = 4 + sin(theta);
  x1 = normrnd(x1,8);
  y1= normrnd(y1,8);

  x2 = 50 + cos(theta);
  y2 = 40 + sin(theta);
  x2 = normrnd(x2,8);
  y2= normrnd(y2,8);
  
  x3 = 10 + cos(theta);
  y3 = 40+ sin(theta);
  x3 = normrnd(x3,8);
  y3= normrnd(y3,8);
  
  x11 = x1';
  y11 = y1';
  
  x22 = x2';
  y22 = y2';
  
  x33 = x3';
  y33 = y3';
  
  class1 = [x11 y11 ones(size(x11))];
  class2 = [x22 y22 2.*ones(size(x22))];
  class3 = [x33 y33 3.*ones(size(x33))];

  data = [class1 ;class2; class3]; 
  save Multi_Class_data.dat data;
end;