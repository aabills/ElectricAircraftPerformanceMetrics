%% Thrust Coefficient and Stuff
% Alec Bills, Carnegie Mellon University
% April 17, 2019

R=90/2;
T=32970.22;
rho=1.225;
V_max=171.6;

V=linspace(0,V_max,1000);
T_c=2.*T./(V.*V.*rho.*pi.*R.*R);
eta_prop=2./(1+sqrt(1+T_c));
figure(1)
plot(V,eta_prop);

