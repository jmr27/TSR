function rhop = srln(rho,delta)
rhop = rho*(1.011+0.001*rho+0.014*delta+0.004*rho^2+0.231*delta^2-0.130*rho*delta);
end