function [k,t] = raylparameter(mu,s)
t = sqrt(2/(4-pi))*s;
k = mu-sqrt(pi/2)*t;
end