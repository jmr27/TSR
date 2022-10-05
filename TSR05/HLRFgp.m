function[alphas,us,beta,step]=HLRFgp(x,Dx,Lx,Mx)
i=1;
syms q p f z
g = 1/q/p-5^2/2/p/f/z-5/q/f/z;
Deltag = gradient(g,[q; p; f; z]).';
G0 = subs(g,[q p f z],Mx.');
eps1=10^(-3);eps2=10^(-3);
u = inv(Lx)*inv(Dx)*(x-Mx);
while 1
    x = Dx*Lx*u+Mx;
    Gu = subs(g,[q; p; f; z],x);
    DeltaG = subs(Deltag,[q; p; f; z],x)*Dx*Lx;
    alpha = - DeltaG/norm(DeltaG);
    if (abs(Gu/G0)<=eps1 && norm(u - alpha*u*alpha.')<=eps2)
        alphas = double(alpha); us = double(u); beta = double(alpha*u); step = double(i);
        break
    else
        u = (alpha*u + Gu/norm(DeltaG))*alpha; u = u.';
        i = i+1;
    end
end