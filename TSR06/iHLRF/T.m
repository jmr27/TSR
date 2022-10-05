function[nR] = T(R,type,delta)
l = length(type);
nR = zeros(size(R));
for i= 1:l
    for j = 1:l
        if type(i)==0 && type(j)==1
            nR(i,j) = delta(j)*R(i,j)/sqrt(log(1+delta(j)^2));
        elseif type(i)==1 && type(j)==0
            nR(i,j) = delta(i)*R(i,j)/sqrt(log(1+delta(i)^2));
        elseif type(i)==1 && type(j)==1
            nR(i,j) = log(1+R(i,j)*delta(i)*delta(j))/sqrt(log(1+delta(i)^2)*log(1+delta(j)^2));
        else
            nR(i,j) = R(i,j);
        end
    end
end
            