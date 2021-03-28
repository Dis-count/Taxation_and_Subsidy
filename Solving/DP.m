function [result, s] = DP(v,t,beta,z)

% t and beta are vectors   from bottom to top
% z = 9.5
% t =[5 4 3 2];
% beta = [14.5 8 11.5 4]
% Notice that V is not here. V (u \neq v)

u = 0; % counting

s = zeros(1,v); % 记录集合中 player

result = z;

for i =1 : v

    if (u+1)*t(i) < beta(i)

      result = result + (u+1)*t(i)- beta(i);

      u = u + 1;

      s(i) = 1;  % add the player

    else

      s(i) = 0;

    end

end

if u == v
%   P = perms(vec); 全排列不可取

  resu = zeros(v,1);

  vec = zeros(v,v);

  for i = 1 : v   % i为几 0就在几? 这样可以减去相应的t

    vec(i,:) = [ones(1,i-1),zeros(1,1),ones(1,v-i)];

    aa = cumsum(vec(i,:));

    resu(i) = z + dot(t,aa)-(i-1)*t(i) - dot(beta,vec(i,:));
    % C n n-1 组合求最小值?

  end

  [result,ind] = min(resu);

  s = vec(ind,:);

end

end
%  [a,b,c,d]=ndgrid(0:1);
%  A=[a(:),b(:),c(:),d(:)];
