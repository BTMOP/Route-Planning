function [ y ] = design(x) %���ź�������
  if x>0
      y =1;
  elseif x == 0
      y=0;
  else
      y=-1;
  end
end