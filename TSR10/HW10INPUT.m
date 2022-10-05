% Problem condition

mu = [510;10]; s = [10;1];
rho = 0.3;
delta = s./mu;
[rhop,rhop2] = sexpgamr(rho,delta(2));
Rp = [1 rhop;
    rhop 1];

% Sample size 10^2 ~ 10^6
% Plot CDF and cumulative frequency diagram
% Get sample mu and sample std and sample corrcoef at each sample size 

[smu,sstd,scor] = Samplesim(8,Rp,mu,s);
% Plot Sample mu and sample std and sample corrcoef at each samplesize

Samplestats(smu,sstd,scor,mu,s,rho);
