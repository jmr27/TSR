function[u] = normTransform(x,M,D,L)
u = L^-1*D^-1*(x-M);
end
