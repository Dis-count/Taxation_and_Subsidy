% At first, we should set up an array to storage the number we need later.

function [an,index,Subsidy,difference] = players0(n,S0,an)

% n is the quantity of players, and m is the number of machine.

% At first, we suppose m>n.

% an = 1:2:10;

% an = sort((round((rand(1,n)*18))+1)/2);  %  ���� 0.5-10 ��0.5Ϊ������������

% used to storage values of each machine time.  ���� ����

% We define this vector as the characteristic vector.

% S0 = 9.5 ;  % Ĭ��

% an2 = zeros(1,nchoosek(n,2));  %  ������Ϊһ��������������������

% for i = 1:nchoosek(n,2)
%
%     bn = nchoosek(an,2); % �õ�ʱ������������ ���˼���
%
%     an2(i) = min(dot([2,1],bn(i,:))+S0 dot([1,1],bn(i,:))+2*S0);
%
%����һ����������˳��
% end

ann = [];
A = eye(n);
%  An��һ��ά��Ϊ(2^n-1,n)�ľ���;
f = (-1)*ones(n,1);

a1 = ff2n(n);

b1 = sum(a1,2);

c1 = [a1,b1];

d1 = sortrows(c1,[n+1 1:n],'descend');

e1 = sortrows(d1,n+1);

A = e1(:,1:n);

A(1,:) = [];  %ɾȥ��һ��

% for i= 2:n-1
%     y = perms(sum(A(1:i,:)));
%     y = unique(y,'rows');  % ȥ���ظ�����
%     % ע�� y ��Ҫ��ת
%     A  = [A;flipud(y)];  % �������ӵõ��ľ���
% end
% A = [A;ones(1,n)];     % �õ���������

for i = 1 : n                    % i�ǲ���������
%  ��һ��ѭ���ҵ�����k�������ߵ��������� ����Ĭ�ϰ�����˳������
    bn = zeros(1,nchoosek(n,i)); % �洢���ս���
    dn = zeros(1,i);
    cn = nchoosek(an,i);        % �洢��������
    for j = 1:nchoosek(n,i)
        %  �ڶ���ѭ���������е�ÿһ�����ϵõ�����
        for k = 1: i         % k�ǻ�������
            s = floor(i/k);  % ȡ��
            r = rem(i,k);
            a = (s+1):-1:1;
            repeat = k;      % ѭ�������Ĵ���
            tmp = repmat(a, repeat, 1);
            b = reshape(tmp, 1, length(a)*repeat);
            b(r+1:k) = [];
            dn(k) = dot(b,cn(j,:)) + k*S0;
        end
        % nm = find(dn==min(dn));  % �ҳ���������
        [minofdn index]=min(dn);
        % ����ȡ��Сֵ
        % disp(['the number of machine is ' num2str(index)]);
        bn(j) = min(dn);
    end
    ann = [ann bn];   % Ҳ����ʹ��ann={};ann=[ann;{bn}] ����ann ʹ�� ann{num}
                      % ����������Ҫ��cellת��Ϊ����
end

A(end,:) = [];  %  delete the last row
cv = ann(end);
ann(end) = []; %  delete the last one element

[x,y] = linprog(f,A,ann);

Subsidy = cv+y;

% Taxation = index * (S0 - 9.5);
Taxation = index * S0;

difference = Subsidy - Taxation;



% a = 5:-1:1;
% repeat = 2;
% tmp = repmat(a, repeat, 1);
% b = reshape(tmp, 1, length(a)*repeat);
%
% B=flipud(A)

%randperm(100,3)   %��������100���ڵ���������

%x=round((rand*(25.9-20.1)+20.1)*10)/10;

% floor/fix
%
% ceil
%
% rem
%
% mod
