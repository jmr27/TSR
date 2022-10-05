function [rhop,rhop2] = sexpgamr(rho,delta)
rhop = rho*(1.104+0.003*rho-0.008*delta+0.014*rho^2+0.173*delta^2-0.296*rho*delta);
rhop2 = rho*(1.014+0.001*rho-0.007*delta+0.002*rho^2+0.126*delta^2-0.090*rho*delta);
end