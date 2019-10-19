function [Pstar,omega] = IPC(v)

% t = [5;4;3;2];
 t= [9;8;7;5.5;4];

 Pstar = [35,50];

%  Pbig = [11,16];
 
 Pbig = [35,50];

omega = zeros(1,2);

while ~isempty(Pbig)

  [a1,b1,c1] =  CP(v,t,Pbig(1,1));   % omega  K_l  K_r  (z_k-1   select K_r)

  [a2,b2,c2] =  CP(v,t,Pbig(1,2));   % (z_k  select K_l)

  omega(1) = a1;

  omega(2) = a2;
  
  slope =  (a2-a1)/(Pbig(1,2)-Pbig(1,1));

  
  if (round(c2,5) == round(slope,5))||(abs(b1-slope)<1e-5)

    Pbig(1,:) = [];

  else

% how to calculate the intersection point

    zinter = (b1*Pbig(1,1) - Pbig(1,2)*c2 + a2 - a1)/(b1-c2);

    if zinter < 35||zinter > 50

        disp('There is something wrong')
        
        break
    
    end
    
    omega1 = (zinter - Pbig(1,2))*b2 + a2;

    omega = [omega,omega1];

    Pstar = [Pstar,zinter];

    Pbig(end+1,:) = [Pbig(1,1),zinter];   % Notice that there is already add a new row

    Pbig(end+1,:) = [zinter,Pbig(1,2)];

    Pbig(1,:) = [];

    Pstar = sort(Pstar);
    
    disp('what')
    
  end

end


end
