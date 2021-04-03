function Construct()

%  This function is used to construct the price-subsidy function.

t = [7.5,6,5.5,4,3,1.5,1.5];

% t = rand(1,n)
interval = pretreatment(t);

x = []; % Restore the value of price at the breakpoints.

y = []; % Restore the value of subsidy at the breakpoints.

for i = 1: length(interval)-1
  aa = interval(i,1:2)
  [list_x, list_y] = IPCtest(t,[aa(1),aa(2)-0.5]);
  x = [x,list_x];
  y = [y,list_y];
end

x = [x,0,interval(1,2)];
y = [y,0,0];

point_xy = [x;y];
point_xy = sortrows(point_xy',1)';

plot(point_xy(1,:),point_xy(2,:));

end
