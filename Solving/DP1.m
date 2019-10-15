function [res1, s] = DP1(v,t,beta,z)

% t and beta are vectors   from top to bottom
% z = 9.5
% t =[5 4 3 2];
% beta = [14.5 8 12.5 4]
% 注意这里不能存在 V (u \neq v)

% u = v-1; % counting

ss = zeros(v-1,v);

res = zeros(v-1,1); % record the min value

for uu = (v-1): -1 : 1

s = zeros(1,v);  % 记录集合 player

result = z;

ii = uu;

  for i = v: -1 : 1

    if ii*t(i) < beta(i)

      result = result + ii*t(i) - beta(i);

      s(i) = 1;  % add the player

      ii = ii-1;  % problem

    else




    end

    if ii < 1

      break

    end

    if (i-1) == ii

      s(1:ii) = 1;

      result =  result + dot((1:ii),t(1:ii)) - sum(beta(1:ii));

      break

    end

  end

  res(uu) = result;

  ss(uu,:) = s;

end

[res1 ind] = min(res);

s = ss(ind,:);

res
ss

end
