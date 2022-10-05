function PfiB = iBreitung(beta,k)
n = size(k,1);
PfiB = normcdf(-beta);
sibeta = normpdf(beta)/normcdf(-beta);
for i=1:n
    PfiB = PfiB/sqrt(1+sibeta*k(i,i));
end
end