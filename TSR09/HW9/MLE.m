function mu = MLE(obdata,sigma)
from = floor(min(obdata));
to = ceil(max(obdata));
n = (to-from)*100+1;
l = length(obdata);
x = linspace(from,to,n);
y = zeros(n,1);
for i= 1:n
    for j = 1:l
        y(i) = y(i)+log(normpdf((obdata(j)-x(i))/sigma));
    end
end
[L,idx] = max(y);
mu = x(idx);
