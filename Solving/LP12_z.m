function [x,maxr] = LP12_z(s,v,t)

% Notice that s is a restricted-coalition matrix.(0-1)  v = 4
% t from large to small 列向量
% 转置即可
s1 = length(s(:,1));  % 约束数量

c_s = zeros(s1,1);

for i =1:s1

    t = sum(s(1,:)==1);

    inde = find(s(1,:)==1);

    c_s(i) = (1:t)*t(inde);

end

f = ones(v,1);
f = [f;0];

b = c_s;

A = [s -ones(v,1)];

[x,fval1] = linprog(-f,A,b);

maxr = -fval1;

end
