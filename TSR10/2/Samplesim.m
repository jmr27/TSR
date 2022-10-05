function [smu,sstd,scor] = Samplesim(n,Rp,mu,s)
smu = zeros(2,n-1);
sstd = zeros(2,n-1);
scor = zeros(1,n-1);
for i=n:-1:2
    X = hwsim(10^i,Rp,mu,s);
    if i==n
        [samplem, samplestd, samplecor,y] = samplecheck(X,mu,s);
        figure; subplot(2,1,1);
        xlabel('X1');
        ylabel('F(x)');
        title('Empirical and Theoritical CDF of X1');
        plot(sort(X(1,:)),y(1,:),'DisplayName','Marginal CDF')
        hold on
        subplot(2,1,2);
        xlabel('X2');
        ylabel('F(x)');
        title('Empirical and Theoritical CDF of X2');
        plot(sort(X(2,:)),y(2,:),'DisplayName','Marginal CDF')
        hold on    
    else
        [samplem, samplestd, samplecor] = samplecheck(X,mu,s);
    end
    smu(:,i-1) = samplem;
    sstd(:,i-1) = samplestd;
    scor(i-1) = samplecor(1,2); 
    subplot(2,1,1);
    [f,x] = ecdf(X(1,:));
    plot(x,f,'DisplayName',['n= ',num2str(i)]);
    subplot(2,1,2);
    [f,x] = ecdf(X(2,:));
    plot(x,f,'DisplayName',['n= ',num2str(i)])
end
subplot(2,1,1);
legend()
subplot(2,1,2);
legend()
hold off
end