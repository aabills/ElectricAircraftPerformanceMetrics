%% Plotting For Ajay Misra Presentation 
% Alec Bills, Carnegie Mellon University
% May 7, 2019

%% Read Data
% Power Profiles
RJ_PP=dlmread('Data/misra/RJ_PowerProfile.csv');
NB_PP=dlmread('Data/misra/NB_PowerProfile.csv');
WB_PP=dlmread('Data/misra/WB_PowerProfile.csv');

%Altitude Profiles
RJ_AP=dlmread('Data/misra/RJ_AltitudeProfile.csv');
NB_AP=dlmread('Data/misra/NB_AltitudeProfile.csv');
WB_AP=dlmread('Data/misra/WB_AltitudeProfile.csv');

%Velocity Profiles
RJ_VP=dlmread('Data/misra/RJ_VelocityProfile.csv');
NB_VP=dlmread('Data/misra/NB_VelocityProfile.csv');
WB_VP=dlmread('Data/misra/WB_VelocityProfile.csv');

%% Plot Profiles
figure(1)
clf
hold on
plot(RJ_AP,'g','LineWidth',3);
plot(NB_AP,'b','LineWidth',3);
plot(WB_AP,'r','LineWidth',3);
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold');
xlabel('Time, [sec]');
ylabel('Altitude, [m]');
legend('Regional','Narrow Body','Wide Body')

figure(2)
clf
hold on
plot(RJ_PP./1e6,'g','LineWidth',3);
plot(NB_PP./1e6,'b','LineWidth',3);
plot(WB_PP./1e6,'r','LineWidth',3);
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold');
xlabel('Time, [sec]');
ylabel('Power, [MW]');
legend('Regional','Narrow Body','Wide Body')

figure(3)
clf
hold on
plot(RJ_VP,'g','LineWidth',3);
plot(NB_VP,'b','LineWidth',3);
plot(WB_VP,'r','LineWidth',3);
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold');
xlabel('Time, Sec');
ylabel('Velocity, m/sec');
legend('Regional','Narrow Body','Wide Body')

figure(4)
clf
plot(NB_AP,'b','LineWidth',3)
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold');
xlabel('Time, [sec]');
ylabel('Altitude, [m]');

figure(5)
clf
plot(NB_VP,'b','LineWidth',3)
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold');
xlabel('Time, [sec]');
ylabel('Velocity, [m/sec]');

%% Parameter Plots

%MTOM
figure(6)
clf
subplot(5,3,1)
plottriangle(0.35,0.4,0.5);
xlim([0.35 0.5])
%xticks(linspace(11500,396890,3))

subplot(5,3,2)
plottriangle(0.35,0.4,0.5)
xlim([0.35 0.5])
%xticks(linspace(11500,396890,3))

subplot(5,3,3)
plottriangle(0.35,0.4,0.5)
xlim([0.35 0.5])
%xticks(linspace(11500,396890,3))

subplot(5,3,4)
plottriangle(7.62,12,12.6)
xlim([7.62 12.6])
%xticks(linspace(7.62,12.6,3))

subplot(5,3,5)
plottriangle(7.79,9.19,10.47)
xlim([7.62 12.6])
%xticks(linspace(7.62,12.6,3))

subplot(5,3,6)
plottriangle(7.9,9.03,10.1)
xlim([7.62 12.6])
%xticks(linspace(7.62,12.6,3))

subplot(5,3,7)
plottriangle(291,451,565)
xlim([291 789])
%xticks(linspace(291,789,3))

subplot(5,3,8)
plottriangle(434,617,789)
xlim([291 789])
%xticks(linspace(291,789,3))

subplot(5,3,9)
plottriangle(504,652,756)
xlim([291 789])
%xticks(linspace(291,789,3))

subplot(5,3,10)
plottriangle(.014,.018,.024)
xlim([.014 .024])
%xticks(linspace(.014,.024,3))

subplot(5,3,11)
plottriangle(.014,.018,.024)
xlim([.014 .024])
%xticks(linspace(.014,.024,3))

subplot(5,3,12)
plottriangle(.014,.018,.024)
xlim([.014 .024])
%xticks(linspace(.014,.024,3))

subplot(5,3,13)
plottriangle(0.85,.9,.95)
xlim([.85 .95])
%xticks(linspace(.014,.024,3))

subplot(5,3,14)
plottriangle(0.85,.9,.95)
xlim([.85 .95])
%xticks(linspace(.014,.024,3))

subplot(5,3,15)
plottriangle(0.85,.9,.95)
xlim([.85 .95])
%xticks(linspace(.014,.024,3))






function output=plottriangle(a,b,c)
x=linspace(a,c,100);
plot(x,pdf(makedist('Triangular','a',a,'b',b,'c',c),x),'k','LineWidth',2)
as=CommaFormat(a);
bs=CommaFormat(b);
cs=CommaFormat(c);
xticks([a,b,c])
xticklabels({as,bs,cs})
yticks([])
ax = gca;
ax.XRuler.Exponent = 0;
set(gca,'FontSize',20,'FontName','Palatino','FontWeight','Bold')
end