function Con_solo(i)

%  This function is used to construct one(i th) interval of the price-subsidy function.
% t = [7.5,6,  5.5,4,3,1.5,1.5,1.5];
t = [7,  6.5,6.5,4,4,3.5,2.5,2, 1.5,1];
% t = rand(1,n)
interval = pretreatment(t);

x = []; % Restore the value of price at the breakpoints.

y = []; % Restore the value of subsidy at the breakpoints.

aa = interval(i,1:2);
[list_x, list_y] = IPCtest(t,[aa(1),aa(2)-0.5]);
x = [x,list_x];
y = [y,list_y];

point_xy = [x;y];
point_xy = sortrows(point_xy',1)';

plot(point_xy(1,:),point_xy(2,:));

xlabel('¶¨¼Û')

ylabel('²¹Ìù')

legend('²¹Ìù','Location','NorthEast' );

saveas(gcf,'soloIPC1.pdf');

end
