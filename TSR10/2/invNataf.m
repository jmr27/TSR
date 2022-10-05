function X = invNataf(Z,mu,s)
X = zeros(size(Z));
for i = 1:size(Z,2)
    X(1,i) = mu(1)-s(1)-s(1)*log(1-normcdf(Z(1,i)));
    X(2,i) = gaminv(normcdf(Z(2,i)),(mu(2)/s(2))^2,s(2)^2/mu(2));
end
end
