function (z,omega) = IPC()

t = [5;4;3;2];

Pstar = [11,16];

P = [0,16];

omega = zeros(1,2);

while length(P) > 0

  [a1,b1,c1] =  CP(4,t,P(1,1));   % omega  K_l  K_r  (z_k-1   select K_r)

  [a2,b2,c2] =  CP(4,t,P(1,2));   % (z_k  select K_l)

  omega(1) = a1;

  omega(2) = a2;

  slope =  (a2-a1)/(P(1,2)-P(1,1));

if (c1 == slope)||(b2==slope)

  P(1,:) = [];

else

% how to calculate the intersection point

  zinter = (c1*P(1,1) - P(1,2)*b2 + a2 - a1)/(c1-b2);

  omega1 = (zinter - P(1,2))*b2 + a2;

  omega = [omega,omega1];

  Psatr = [Psatr,zinter];

  P(end+1,:) = [P(1,1),zinter];

  P(end+2,:) = [zinter,P(1,2)];

  P(1,:) = [];

  sort(Pstar);

end

end


end
