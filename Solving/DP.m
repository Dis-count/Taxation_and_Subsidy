function [res, s] = DP(v,t,beta,z)

% t and beta are vectors
% z = 9.5
% t =[5 4 3 2];
% beta = [14.5 8 12.5 4]
% 注意这里不能存在 V (u \neq v)

% u = v-1; % counting

s = zeros(1,v); % 记录集合��? player

ss = zeros(v-1,v);


res = zeros(v-1,1); % record the min value

for uu = v-1: -1 : 1

result = z;

  for i = v: -1 : 1

    ii = uu;

    if ii*t(i) < beta(i)

      result = result + ii*t(i) - beta(i);

      s(i) = 1;  % add the player

      ii = ii-1;  % problem

    end

    if ii < 1

      break

    end

    if (i-1) == ii

      s(1:ii) = 1;

      result =  dot((1:ii),t(1:ii)) - sum(beta(1:ii));

      break

    end

  end

  res(uu) = result;

  ss(uu,:) = s;

end

ss

end
