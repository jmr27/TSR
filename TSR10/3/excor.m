function Rp = excor(R,delta)
Rp = zeros(3);
for i = 1:3
    Rp(i,i) = 1;
end
Rp(1,2) = srln(R(1,2),delta(2));
Rp(2,3) = uln(R(2,3),delta(2));
Rp(1,3) = usr(R(1,3));
Rp(2,1) = srln(R(2,1),delta(2));
Rp(3,2) = uln(R(3,2),delta(2));
Rp(3,1) = usr(R(3,1));
end
