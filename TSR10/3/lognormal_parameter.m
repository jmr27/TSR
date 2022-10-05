function[lam,x] = lognormal_parameter(m,d)
lam=log(m)-0.5*log(1+d^2);
x = sqrt(log(1+d^2));
end