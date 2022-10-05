function X = hwsim(n,Rp,mu,s)
Y = pnr(n);
Z= corn(Y,Rp);
X = invNataf(Z,mu,s);
end