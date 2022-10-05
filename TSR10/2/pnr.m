function Y = pnr(n)
U = rand(2,n);
Y = zeros(2,n);
for i =1:n
    Y(:,i) = [sqrt(-2*log(U(1,i)))*sin(2*pi*U(2,i));
        sqrt(-2*log(U(1,i)))*cos(2*pi*U(2,i))];
end
end