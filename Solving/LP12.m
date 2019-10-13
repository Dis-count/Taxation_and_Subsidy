function [minr,maxr] = LP9(s,v,)

% Notice that s is a restricted-coalition matrix.(0-1)  v = 4

% s=[0 1 1 0;
%    0 1 0 1;
%    0 0 1 1;
%    1 1 1 0;
%    1 1 0 1;
%    1 0 1 1;]

% 转置即可
s1 = length(s(:,1));

f = ones(s1,1);

b = ones(v,1);

lb = zeros(s1,1);

ub = ones(s1,1);

[x,fval1] = linprog(-f,[],[],s',b,lb,ub);

minr = fval1;

[x,fval2] = linprog(f,[],[],s',b,lb,ub);

maxr = -fval2;

end
