syms m s
a = sqrt(2/(4-pi))*s;
x0 = m - sqrt(pi/(4-pi))*s;
da = gradient(a,[m s]);
dx0 = gradient(x0,[m s]);
gradbeta = formresults.beta_sensi_thetaf(1,3:4);
gradpf = formresults.pf_sensi_thetaf(1,3:4);
altpara = probdata.parameter(1,1:2);
da = double(subs(da',[m s],altpara));
dx0 = double(subs(dx0',[m s],altpara));
altgradbeta = gradbeta*[da;dx0];
altgradpf = gradpf*[da;dx0];
delta = formresults.beta_sensi_thetaf(:,1).*probdata.parameter(:,2);
eta = formresults.beta_sensi_thetaf(:,2).*probdata.parameter(:,2);
deltacont= delta.^2;
etacont = eta.^2;