clear all; close all;
mu = [20; 5;4];
s = [3.5;0.8;0.4];
delta = s./mu;
R = [1.0 0.2 0.3;
    0.2 1.0 0.1;
    0.3 0.1 1.0];

% correlated

FERUM_HW7_INPUT;
ferum;
3;

n = 5;
[P11,cov11] = PMonteCarlo(n,R,mu,s);
[P12,cov12] = Impsample(n,1,R,mu,s,formresults);
[P13,cov13] = Impsample(n,2,R,mu,s,formresults);
PfCMonte = P11(10^n);PfCImp1 = P12(10^n);PfCImp2 = P13(10^n);
covCMonte = cov11(10^n);covCImp1 = cov12(10^n);covCImp2 = cov13(10^n);

% independent

FERUM_HW10_IND;
ferum;
3;

R = eye(3);
Rp = excor(R,delta);
[P21,cov21] = PMonteCarlo(n,R,mu,s);
[P22,cov22] = Impsample(n,1,R,mu,s,formresults);
[P23,cov23] = Impsample(n,2,R,mu,s,formresults);
PfIMonte = P21(10^n);PfIImp1 = P22(10^n);PfIImp2 = P23(10^n);
covIMonte = cov21(10^n);covIImp1 = cov22(10^n);covIImp2 = cov23(10^n);

x = linspace(1,10^n,10^n);
figure; subplot(2,1,1);
title('Correlated Pf');
xlabel('N of samples');
ylabel('Pf');
plot(x,P11,'DisplayName','MonteCarlo');
hold on
plot(x,P12,'DisplayName','ImpSample step1');
hold on
plot(x,P13,'DisplayName','ImpSample step2');
legend('Location','best');
hold off
subplot(2,1,2);
title('Correlated c.o.v');
xlabel('N of samples');
ylabel('c.o.v');
plot(x,cov11,'DisplayName','MonteCarlo');
hold on
plot(x,cov12,'DisplayName','ImpSample step1');
hold on
plot(x,cov13,'DisplayName','ImpSample step2');
legend('Location','best');
hold off
figure; subplot(2,1,1);
title('Independent Pf');
xlabel('N of samples');
ylabel('Pf');
plot(x,P21,'DisplayName','MonteCarlo');
hold on
plot(x,P22,'DisplayName','ImpSample step1');
hold on
plot(x,P23,'DisplayName','ImpSample step2');
legend('Location','best');
hold off
subplot(2,1,2);
title('Independent c.o.v');
xlabel('N of samples');
ylabel('c.o.v');
plot(x,cov21,'DisplayName','MonteCarlo');
hold on
plot(x,cov22,'DisplayName','ImpSample step1');
hold on
plot(x,cov23,'DisplayName','ImpSample step2');
legend('Location','best');
hold off

disp(['Correlated Pf by Monte Carlo : ',num2str(PfCMonte)]);
disp(['Correlated c.o.v by Monte Carlo : ',num2str(covCMonte)]);
disp(['Correlated Pf by ImpSample step 1 : ',num2str(PfCImp1)]);
disp(['Correlated c.o.v by ImpSample step 1 : ',num2str(covCImp1)]);
disp(['Correlated Pf by ImpSample step 2 : ',num2str(PfCImp2)]);
disp(['Correlated c.o.v by ImpSample step 2 : ',num2str(covCImp2)]);
disp(['Independent Pf by Monte Carlo : ',num2str(PfIMonte)]);
disp(['Independent c.o.v by Monte Carlo : ',num2str(covIMonte)]);
disp(['Independent Pf by ImpSample step 1 : ',num2str(PfIImp1)]);
disp(['Independent c.o.v by ImpSample step 1 : ',num2str(covIImp1)]);
disp(['Independent Pf by ImpSample step 2 : ',num2str(PfIImp2)]);
disp(['Independent c.o.v by ImpSample step 2 : ',num2str(covIImp2)]);
