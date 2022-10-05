function [samplem, samplestd, samplecor,y] = samplecheck(X,mu,s)
samplem = sum(X,2)/size(X,2);
samplestd = sqrt(sum((X-samplem).^2,2)/(size(X,2)-1));
samplecor = corrcoef(X');
y = zeros(2,size(X,2));
y(1,:) = 1-exp(-(sort(X(1,:))-mu(1)+s(1))/s(1));
y(2,:) = gamcdf(sort(X(2,:)),(mu(2)/s(2))^2,s(2)^2/mu(2));
end
