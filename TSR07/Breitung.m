function PfB = Breitung(beta,k)
n = size(k,1);
PfB = normcdf(-beta);
for i=1:n
    PfB = PfB/sqrt(1+beta*k(i,i));
end
end