function [x,maxr] = LP12(s,v,t,z)

% Notice that s is a restricted-coalition matrix.(0-1)  v = 4
% t from large to small 列向��?
% 转置即可
s1 = length(s(:,1));  % 约束数量

c_s = zeros(s1,1);

for i =1:s1

    tot = sum(s(i,:)==1);

    inde = s(i,:)==1;  % may not use the function 'find'

    c_s(i) = dot(1:tot,t(inde)) + z;

end

f = ones(v,1);

b = c_s;

[x,fval1] = linprog(-f,s,b);

maxr = -fval1;

end
