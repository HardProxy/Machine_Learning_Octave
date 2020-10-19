function Creat_Data
  for i = 1:100,
    x1(i,1) = i;
    x2(i,1) = i;
  end;
  dados = [ x1, x2];
  save Esperado.dat dados;
  x2 = normrnd(x2, 10);
  for i = 1:100,
    if x2(i,1) > i,
      y(i,1) = 1;
    else
      y(i,1) = 0;
    endif;
  end;

  data = [x1 x2];
  save Data.dat data;
  save Classification.dat y;
  