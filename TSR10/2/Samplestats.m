function Samplestats(smu,sstd,scor,mu,s,rhop)
n = size(smu,2);
x = linspace(2,n+1,n);
mulin = repmat(mu,1,n);
slin = repmat(s,1,n);
corlin = repmat(rhop,1,n);
figure; subplot(2,3,1);
plot(x,smu(1,:))
hold on
plot(x,mulin(1,:))
xlabel('Sample size(log10 scale)');
ylabel("X1's sample mean");
legend('Sample mean','Mean','Location','best');
hold off
subplot(2,3,2);
plot(x,sstd(1,:))
hold on
plot(x,slin(1,:))
xlabel('Sample size(log10 scale)');
ylabel("X1's sample std");
legend('Sample std','std','Location','best');
hold off
subplot(2,3,3);
plot(x,scor)
hold on
plot(x,corlin)
xlabel('Sample size(log10 scale)');
ylabel("X1,X2's sample corrcoef");
legend('Sample corrcoef','Corrcoef','Location','best');
hold off
subplot(2,3,4);
plot(x,smu(2,:))
hold on
plot(x,mulin(2,:))
xlabel('Sample size(log10 scale)');
ylabel("X2's sample mean");
legend('Sample mean','Mean','Location','best');
hold off
subplot(2,3,5);
plot(x,sstd(2,:))
hold on
plot(x,slin(2,:))
xlabel('Sample size(log10 scale)');
ylabel("X2's sample std");
legend('Sample std','std','Location','best');
hold off
end