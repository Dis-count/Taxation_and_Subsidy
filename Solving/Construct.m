function Construct()

%  This function is used to construct the price-subsidy function.

t = [7.5,6,5.5,4,3,1.5,1.5,1.5];

% t = rand(1,n)
interval = pretreatment(t)

x = []; % Restore the value of price at the breakpoints.

y = []; % Restore the value of subsidy at the breakpoints.

for i = 1: length(interval)

  [list_x, list_y] = IPC(t, interval(i,:));

  x = [x list_x];

  y = [y list_y];

end

plot(x,y)
