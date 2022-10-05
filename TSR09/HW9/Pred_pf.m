function Pf = Pred_pf(mug,sigmag,mus,sigmas)
fun = @(x) exp(-(x-mus).^2/2/sigmas.^2).*(1+erf((x-mug)/sqrt(2)/sigmag))/sqrt(2*pi)/sigmas/2;
Pf = integral(fun,-Inf,Inf);