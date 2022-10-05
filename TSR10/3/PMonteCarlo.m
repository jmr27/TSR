function [P,cov] = PMonteCarlo(n,R,mu,s)
P = zeros(1,10^n);
cov = zeros(1,10^n);
% x = linspace(1,10^n,10^n);
count = 0;
X = hwMonteCarlo(n,R,mu,s);
for i=1:10^n
    if 6.2*X(1,i)-X(2,i)*X(3,i)^2<0
        count = count+1;
    end
    P(i) = count/i;
    cov(i) = sqrt((1-P(i))/P(i)/i);
end
% Pf = P(10^n);
% COV = cov(10^n);
% figure; subplot(2,1,1);
% plot(x,P);
% xlabel('N of samples');
% ylabel('Pf');
% subplot(2,1,2);
% plot(x,cov);
% xlabel('N of samples');
% ylabel('c.o.v');