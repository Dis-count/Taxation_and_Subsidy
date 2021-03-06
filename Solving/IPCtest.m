function [Pstar,omega] = IPCtest(t,Pbig)

% Pre-treatment: Give all the sub-intervals [P_m+1,P_m]

% Return intersection set and the corresponding subsidy
% then we just need connect these points

% t = [5;4;3;2];

% t= [9;8;7;5.5;4];
% t = [7.5,6,5.5,4,3,1.5,1.5,1.5];
% t = [8,7.5,7.5,7,5.5,5,1.5,1.5,1.5,1,1];

v = length(t);

Pstar = Pbig; % The set of breakpoints
% Pstar = interval;

% Pbig = [11,16];

% Pbig = [41,68];  % The interval of price and will gradually decrease

% Pbig  = interval;

omega = zeros(1,2);

count = 0;

while ~isempty(Pbig)

  %
  % if count > 20
  %   disp('There is something wrong in the loop.')
  %   break
  % end

  [a1,b1,c1] =  CP(v,t,Pbig(1,1));   % omega  K_l  K_r  (z_k-1   select K_r)

  [a2,b2,c2] =  CP(v,t,Pbig(1,2));   % (z_k  select K_l)

  if count < 0.5
    omega(1) = a1;

    omega(2) = a2;
  end

  count = count + 1;

  slope =  (a2-a1)/(Pbig(1,2)-Pbig(1,1)); % negative

  if (round(b2,5) == round(slope,5))||(abs(c1-slope)<1e-5)

    Pbig(1,:) = [];

  else

% how to calculate the intersection point

    zinter = (c1*Pbig(1,1) - Pbig(1,2)*b2 + a2 - a1)/(c1-b2);

    % if zinter < 41||zinter > 68
    %
    %     disp('There is something wrong')
    %
    %     break
    %
    % end

    % omega1 = (zinter - Pbig(1,2))*b2 + a2;
    omega1 = (zinter - Pbig(1,2))*b2 + a2;

    [a,b,c] = CP(v,t,zinter);

    if abs(omega1-a) < 1e-5 % the subsidy equals, this is the breakpoint, then delete this interval, store the breakpoint

      omega = [omega,omega1];

      Pstar = [Pstar,zinter];

      Pbig(1,:) = [];

    else

      Pbig(end+1,:) = [Pbig(1,1),zinter];
      % Notice that there is already add a new row

      Pbig(end+1,:) = [zinter,Pbig(1,2)];

      Pbig(1,:) = [];
    end

    % Pstar = sort(Pstar);

    % disp('OK')

  end
end

end
