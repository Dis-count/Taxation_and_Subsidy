function unsatisfied = LP12Return(s,v,t,z)

% This function is used to obtain all the unsatified coalitions.

% Notice that s is a restricted-coalition matrix.(0-1)  v = 4
% which is obtained from CP method.
% t is arranged from large to small  column vector

% return all the unsatified coalitions.

% transpose is ok

s1 = length(s(:,1));  % the number of constraints

c_s = zeros(s1,1);

for i =1:s1

    tot = sum(s(i,:)==1);

    inde = s(i,:)==1;  % may not use the function 'find'

    c_s(i) = dot(1:tot,t(inde)) + z;

end

f = ones(v,1);

b = c_s;

% optimset('Display','off');

[x,fval,exitflag,output,lambda] = linprog(-f,s,b);

inde = lambda.ineqlin ~= 0;

normal_order = (1:s1)';
normal_order = normal_order(inde);

unsatisfied = s(normal_order,:);

end
