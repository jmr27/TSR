function P = OtJCP(i,j,k,L,n,lam,xeta)
x = L/(n-i+1);
y = L/(n-j+1);
z = L/(n-k+1);
Fx = normcdf((log(x)-lam)/xeta);
Fy = normcdf((log(y)-lam)/xeta);
Fz = normcdf((log(z)-lam)/xeta);
P = 0;
if (x<y)&&(y<z)
    for r = i:n
        b = nchoosek(n,r);
        for s = max(0,j-r):n-r
            c = nchoosek(n-r,s);
            for t = max(0,k-r-s):n-r-s
                d = nchoosek(n-r-s,t);
                P = P + b*c*d*Fx^r*(Fy-Fx)^s*(Fz-Fy)^t*(1-Fz)^(n-r-s-t);
            end
        end
    end
elseif (y<x) && (y<z)
    P = OJCP(j,k,L,n,lam,xeta);
else
    P = OCP(k,L,n,lam,xeta);
end
end