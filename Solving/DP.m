function [result, s] = DP(v,t,beta,z)

% t and beta are vectors
% z = 9.5
% t =[5 4 3 2];
% beta = [14.5 8 12.5 4]


u = 1; % counting

s = zeros(1,v); % 记录集合中player

result = z;

for i =1 : v

    if u*t(i) < beta(i)

      result = result + u*t(i)- beta(i);

      u = u + 1;

      s(i) = 1;  % add the player

    end

end

end
