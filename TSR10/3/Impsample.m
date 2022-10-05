function [P,cov] = Impsample(n,step,R,mu,s,formresults)
ustar = formresults.dsptu;
I = eye(3);
samplesig = step^2*I;
detsig = det(samplesig);
invsig = inv(samplesig);
Y = mvnrnd(ustar,samplesig,10^n)';
delta = s./mu;
Rp = excor(R,delta);
Z = corn(Y,Rp);
X = invNatafsrlnu(Z,mu,s);
sum_q = 0;
sum_q2 = 0;
P = zeros(1,10^n);
cov = zeros(1,10^n);
% x = linspace(1,10^n,10^n);
for i=1:10^n
    u = Y(:,i);
    f = 1/sqrt(2*pi)^3*exp(-0.5* u' * u);
    h = 1/sqrt(2*pi)^3/sqrt(detsig)*exp(-0.5*(u-ustar)'*invsig*(u-ustar));
    if 6.2*X(1,i)-X(2,i)*X(3,i)^2<0
        I = 1;
    else 
        I= 0;
    end
    q = I*f/h;
    sum_q = sum_q+q;
    sum_q2 = sum_q2+q^2;
    P(i) = sum_q/i;
    varPf = 1/i*(1/i*sum_q2-P(i)^2);
    cov(i) = sqrt(varPf)/P(i);
end
% Pf = P(10^n);
% COV = cov(10^n);
% figure; subplot(2,1,1);
% plot(x,P);
% xlabel('N of samples');
% ylabel('Pf');
% hold on
% subplot(2,1,2);
% plot(x,cov);
% xlabel('N of samples');
% ylabel('c.o.v');
% hold on
