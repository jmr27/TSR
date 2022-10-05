function X = hwMonteCarlo(n,R,mu,s)
m = zeros(3,1);
sigma = eye(3);
Y = mvnrnd(m,sigma,10^n);
Y = Y';
delta = s./mu;
Rp = excor(R,delta);
Z = corn(Y,Rp);
% Y = pnr3(10^n);
X = invNatafsrlnu(Z,mu,s);
end
