function [omega,K_l,K_r] = CP(v,t,z)

% Set the initial coalition s ={{1},{2},{3}...{v}}
% beta is the optimal solution
% opt_s is a vector optimal solution s.
% t is the time cost for every player.
% v is number of players.
% z is the penalty or the price.
% m is the number of optimal using machines
% return subsidy and min / max slope

% ini_s = [0     1     1     1
%          1     1     0     1
%          1     0     1     1
%          1     1     0     0];

ini_s = 1 - eye(v);

% t= [9;8;7;5.5;4];
% cV = dot(1:v,t) + z;  % this is only one machine situation
cV = TCost(t,z);  % c_V = m*z +sum_t;

flag = true;

count = 0;

% count_s = 0;

while flag

  [beta, maxr] = LP12(ini_s,v,t,z);

  [delta, opt_s] = DP1(v,t,beta,z)

  if delta < -0.001

    ini_s = [ini_s;opt_s];

    % count_s = count_s +1;
    % if count_s < v+1
    %   ini_s(1,:) = [];
    % end

  else

    % here use LP12 obtain the maximum unsatisfied coalition

    omega = cV - maxr;

    unsatisfied = LP12Return(ini_s,v,t,z);

    % if length(ini_s(:,1)) > v
    %
    %     ini_s = ini_s(v+1:end,:);
    %
    % end

    [K_l, K_r] = LP9(unsatisfied,t,z);

    flag = false;

  end

  count = count +1;

  if count >100
  % ini_s
      disp('There is something wrong in CP')
      break
  end

end

end
