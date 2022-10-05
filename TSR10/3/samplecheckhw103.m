function [X,S] = samplecheckhw103(n,R,mu,s)
X = hwMonteCarlo(n,R,mu,s);
y = zeros(size(X));
[mu(1),s(1)] = raylparameter(mu(1),s(1));
[mu(2),s(2)] = lognormal_parameter(mu(2),s(2)/mu(2));
y(1,:) = raylcdf(sort(X(1,:))-mu(1),s(1));
y(2,:) = logncdf(sort(X(2,:)),mu(2),s(2));
y(3,:) = unifcdf(sort(X(3,:)),mu(3)-sqrt(3)*s(3),mu(3)+sqrt(3)*s(3));
S = y(1,:);
% y(1,:) = raylpdf(sort(X(1,:))-mu(1),s(1));
% y(2,:) = lognpdf(sort(X(2,:)),mu(2),s(2));
% y(3,:) = unifpdf(sort(X(3,:)),mu(3)-sqrt(3)*s(3),mu(3)+sqrt(3)*s(3));
figure; 
for i = 1:3
    subplot(3,1,i);
%     histogram(X(i,:),'Normalization','pdf');
    cdfplot(X(i,:));
    hold on
    plot(sort(X(i,:)),y(i,:));
    legend('emp','theo');
    hold off
end
end