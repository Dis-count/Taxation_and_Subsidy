function [omega,K_l,K_r] = CP(v,t,z)

% Set the initial coalition s ={{1},{2},{3}...{v}}
% beta is the optimal solution
% opt_s is a vector optimal solution s.
% t is the time cost for every player.
% v is number of players.
% z is the penalty or the price.

% ini_s = [0     1     1     1
%          1     1     0     1
%          1     0     1     1
%          1     1     0     0];

ini_s = eye(v);

% c_V = m*z +sum_t;

flag = true;

while flag

  [beta, maxr] = LP12(ini_s,v,t,z);

  [delta, opt_s] = DP1(v,t,beta,z);

  if delta < 0

     ini_s = [ini_s;opt_s];

  else

    omega = 38 - beta;

    ini_s = ini_s(v+1:end,:);

    [K_l, K_r] = LP9(ini_s,v);

    flag = false;

  end

end
K_r
ini_s
end
