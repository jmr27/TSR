function Z = corn(Y,Rp)
Lp = chol(Rp)';
Z = Lp*Y;
end