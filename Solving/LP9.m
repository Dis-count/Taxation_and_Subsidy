function [minr,maxr] = LP9(s,v)

% Notice that s is a matrix. (0-1)

% 转置即可
s1 = length(s(1,:));

f = ones(s1,1);

b = ones(v,1);

lb = zeros(s1,1);

ub = ones(s1,1);

[x,fval] = linprog(f,[],[],s,b,lb,ub);

minr = -fval;

maxr =

end
