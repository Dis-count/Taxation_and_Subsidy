% this function is used to obtain the interval of price given the initial processing time of each player.

function I = pretreatment(t)

%  t is given in descending order.
% return a list of interval

t1 = fliplr(t); % reverse the list

N = length(t);

normal_order = N:-1:1;

% c_V1 = dot(normal_order, t);
%  this loop is used to obtain the c-Vi

cV = zeros(1,ceil(N/2));

for k = 1: ceil(N/2)
    s = floor(N/k);
    r = rem(N,k);
    a = (s+1):-1:1;
    repeat = k;
    tmp = repmat(a, repeat, 1);
    b = reshape(tmp, 1, length(a)*repeat);
    b(1:k-r) = [];
    cV(k) = dot(b,t1);
end

price = diff(fliplr(cV));  % [p_n/2, p_n/2-1,...,p_2]

p_1 = dot(0:N-1, t);

price(end+1) = p_1;

price = [0, price];

I = zeros(ceil(N/2),2);

for i = 1: ceil(N/2)

  I(i,:) = [price(i),price(i+1)];

end
