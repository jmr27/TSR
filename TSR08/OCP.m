function P = OCP(i,L,n,lam,xeta)
x = L/(n-i+1);
F = normcdf((log(x)-lam)/xeta);
P = 0;
for r=i:n
    b = nchoosek(n,r);
    P = P+b*F^r*(1-F)^(n-r);
end
end
