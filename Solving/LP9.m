function [minr,maxr] = LP9(s,v)

% Notice that s is a matrix. (0-1)  v = 4
% used to give the min and max slope value.
% s=[0 1 1 0;
%    0 1 0 1;
%    0 0 1 1;
%    1 1 1 0;
%    1 1 0 1;
%    1 0 1 1;]
m_v = 1;
% 转置即可
s1 = length(s(:,1));

f = ones(s1,1);

b = ones(v,1);

lb = zeros(s1,1);

ub = ones(s1,1);

[x,fval1] = linprog(-f,[],[],s',b,lb,ub);

minr = m_v+fval1;

[x,fval2] = linprog(f,[],[],s',b,lb,ub);

maxr = m_v-fval2;

end
