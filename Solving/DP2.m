function res = DP2(v,u)  % 递归耗内存

t = [5 4 3 2];

beta = [14.5 8 11.5 4];

z = 9.5;

if v==1&u==0

  res = z;


elseif v==1&u==1

  res = z + t(1)-beta(1);

else

  res = min(DP2(v-1,u),DP2(v-1,u-1)+u*t(v)-beta(v));

end
