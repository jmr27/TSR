function[x] = invcdfTransform(u,type,M,D,delta)
l = length(M);
x = zeros(size(u));
for i=1:l
    if type(i)==1
        [mu,sigma] = lognormal_parameter(M(i),delta(i));
        pd = makedist('Lognormal','mu',mu,'sigma',sigma);    
    else
        pd = makedist('Normal','mu',M(i),'sigma',D(i,i));
    end
    x(i) = icdf(pd,normcdf(u(i)));
end
end