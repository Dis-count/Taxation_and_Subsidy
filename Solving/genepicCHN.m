function genepicCHN(k)

% m is the number of pictures you want generate.
% k is the number of x axis interval points. 280
an = [1 1.5 2 2.5 3.5 4 4 6.5 6.5 7];

randomresult = zeros(k,10);

theresult = zeros(k,3);

for i=1:k

    [a b c d] = players(10,0.5*(i-1),an);

    randomresult(i,:) = a;
    theresult(i,1) = b;
    theresult(i,2) = c;
    theresult(i,3) = d;

end

% result = [randomresult,theresult];

    x = 1*(0:0.5:k/2-0.5);

% plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*',x,theresult(1:100,3),'m-s');


    % yyaxis left
    plot(x,theresult(1:k,1),'b',x,theresult(1:k,2),'r-.')

    ylabel('最优机器使用数量 & 补贴')

    % yyaxis right
    % plot(x,theresult(1:k,3),'m--')

    % ylim([-100 80])

    % xlabel('定价')
    %
    % ylabel('定价减补贴')

    % legend('Num of machines','补贴','Subsidy minus Pricing','Location','Best');

    hi = legend('最优机器使用数量','补贴','Location','NorthEast' );
    title(num2str(an))
    set(hi,'fontsize',8);
    % h = figure(1);

% figure(1),plot(x,theresult(1:100,1),'r-o',x,theresult(1:100,2),'b--*');

   % pn = sprintf('Pic%03i.jpg',j);
   % print(gcf, '-djpeg', pn)

   saveas(gcf,'pic1.pdf');

   % print(gcf,'-djpeg',['Image1.jpg']);

% imwrite(vectors,'test1.png')

%  figure(2),plot(x,theresult(1:100,3),'m-.');
