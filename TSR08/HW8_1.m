n = size(formresults.alpha);
alpha_cont = formresults.alpha.^2;
for i = 1:n
    if formresults.alpha(i)>0
        disp(i)
        disp('u represents demand')
        disp('contribution : ')
        disp(alpha_cont(i))
    elseif formresults.alpha(i)<0
        disp(i)
        disp('u represents capacity')
        disp('contribution : ')
        disp(alpha_cont(i))
    else
       disp(i),disp('th')
       disp('u contributes none')
    end
end
gamma_cont = formresults.imptg.^2;
for i = 1:n
    if formresults.imptg(i)>0
        disp(i)
        disp('x hat represents demand')
        disp('contribution : ')
        disp(gamma_cont(i))
    elseif formresults.imptg(i)<0
        disp(i)
        disp('xhat represents capacity')
        disp('contribution : ')
        disp(gamma_cont(i))
    else
       disp(i)
       disp('x hat contributes none')
    end
end