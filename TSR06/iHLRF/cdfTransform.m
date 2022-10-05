function[u] = cdfTransform(x,type,M,D,delta)
l = length(M);
u = zeros(size(x));
for i=1:l
    if type(i)==1
        [mu,sigma] = lognormal_parameter(M(i),delta(i));
        pd = makedist('Lognormal','mu',mu,'sigma',sigma);    
    else
        pd = makedist('Normal','mu',M(i),'sigma',D(i,i));
    end
    u(i) = norminv(cdf(pd,x(i)));
end
end

