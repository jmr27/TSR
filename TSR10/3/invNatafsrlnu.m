function X = invNatafsrlnu(Z,mu,s)
X = zeros(size(Z));
[mu(1),s(1)] = raylparameter(mu(1),s(1));
[mu(2),s(2)] = lognormal_parameter(mu(2),s(2)/mu(2));
for i=1:size(Z,2)
    X(1,i) = mu(1)+s(1)*sqrt(-2*log(1-normcdf(Z(1,i))));
    X(2,i) = exp(mu(2)+s(2)*Z(2,i));
    X(3,i) = mu(3)-sqrt(3)*s(3)+2*sqrt(3)*s(3)*normcdf(Z(3,i));
end
end