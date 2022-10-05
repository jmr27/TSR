function [J] = Jacob(u,type,M,D,delta)
l = length(M);
J = zeros(size(D));
x = zeros(size(u));
for i  = 1:l
    if type(i)==1
        [mu,sigma] = lognormal_parameter(M(i),delta(i));
        pd = makedist('Lognormal','mu',mu,'sigma',sigma);
    else
        pd = makedist('Normal','mu',M(i),'sigma',D(i,i));
    end
    x(i) = invcdfTransform(u(i),type(i),M(i),D(i,i),delta(i));
    J(i,i) = normpdf(u(i))/pdf(pd,x(i));
end
