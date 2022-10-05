function P = OJCP(i,j,L,n,lam,xeta)
x = L/(n-i+1);
y = L/(n-j+1);
Fx = normcdf((log(x)-lam)/xeta);
Fy = normcdf((log(y)-lam)/xeta);
P = 0;
if x<y
    for r = i:n
        b = nchoosek(n,r);
        for s = max(0,j-r):n-r
            c = nchoosek(n-r,s);
            P = P+b*c*Fx^r*(Fy-Fx)^s*(1-Fy)^(n-r-s);
        end
    end
else
    P = OCP(j,L,n,lam,xeta);
end
end