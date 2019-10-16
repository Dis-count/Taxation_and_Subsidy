function [res, s] = DP1(v,t,beta,z)

% t and beta are vectors   from bottom to top
% z = 9.5
% t =[5 4 3 2];
% beta = [14.5 8 12.5 4]

% 注意这里不能存在 V (u \neq v)

% s is the optimal solution

P = ones(v, v+1);

P(1,1) = z;  %  P(1,0)

P(1,2) = z + t(1) - beta(1) ;  %  P(1,1)

ss = cell(v,v+1);  % Used to store the corresponding player vector.

ss(1,1) = {zeros(1,1)};

ss(1,2) = {ones(1,1)};

for i = 2: v

  % s = ss(:,);  %  每一个循��? 只能记录 该列

  P(i,1) = P(i-1,1);
  ss(i,1) = {zeros(1,i)};

  P(i,i+1) = P(i-1,i) + i*t(i) - beta(i);
  ss(i,i+1) = {ones(1,i)};

  for j = 1: i-1

    if P(i-1,j+1) > (P(i-1,j)+ j*t(i)-beta(i))

      P(i,j+1) = P(i-1,j)+ j*t(i)-beta(i); % notice that j is not the ordinal number

      ss(i,j+1) = {[ss{i-1,j},1]};

    else

      P(i,j+1) = P(i-1,j+1);  %

      ss(i,j+1) = {[ss{i-1,j+1},0]};

    end

  end


end

[res,ind] = min(P(v,2:v)); % record the P(v,u) u \in (1:v-1)
P
s = ss{v,1+ind};

end
