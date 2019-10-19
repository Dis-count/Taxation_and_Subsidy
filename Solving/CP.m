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

% t= [9;8;7;5.5;4];

% c_V = m*z +sum_t;

flag = true;

count = 0;

while flag

  [beta, maxr] = LP12(ini_s,v,t,z);

  [delta, opt_s] = DP1(v,t,beta,z);

  if delta < -0.01

     ini_s = [ini_s;opt_s];

  else

    omega = dot(1:v,t)+z - maxr;

    if length(ini_s(:,1)) > v
    
        ini_s = ini_s(v+1:end,:);

    end
    
    [K_l, K_r] = LP9(ini_s,v);

    flag = false;

  end

  count = count +1;
  
  if count >100
  % ini_s
      disp('There is something wrong')
      break
  end
  
end


end
