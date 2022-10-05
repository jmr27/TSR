function [mu_posterior,sigma_posterior] = Conjugate(obdata,mu_prior,sigma_prior)
mu_sample = mean(obdata);
var_sample = var(obdata);
n = length(obdata);
var_prior = sigma_prior^2;
mu_posterior = (mu_prior/var_prior+n*mu_sample/var_sample)/(1/var_prior+n/var_sample);
sigma_posterior = (1/var_prior+n/var_sample)^(-1/2);