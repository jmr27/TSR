% iHLRF input and performing FORM

M = [220; 100; 80];
delta = [0.1; 0.1; 0.1];
D = diag(M.*delta);
R1 = eye(3);
R = [1 0.2 0.2;
    0.2 1 0.2;
    0.2 0.2 1];
syms y [3 1];
g = y1-sqrt(y2^2+3*y3^2);
Dg = gradient(g,y);
type = [0 1 1];

% P0 Jointly normal case Pf, P1 SI case Pf, P2 Nataf case Pf

[P0,alpha0,ud0,xd0,beta0,step0,erf10,erf20] = iHLRF(y,g,Dg,M,D,R,delta,type,0)
[P1,alpha1,ud1,xd1,beta1,step1,erf11,erf21] = iHLRF(y,g,Dg,M,D,R1,delta,type,1)
[P2,alpha2,ud2,xd2,beta2,step2,erf12,erf22] = iHLRF(y,g,Dg,M,D,R,delta,type,1)