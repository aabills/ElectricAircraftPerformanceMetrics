%% Matlab Plotting For Paper
% Alec Bills, Carnegie Mellon University
% April 9, 2019
%Load Variables
clc
clear all

RJ_HISTOGRAM=dlmread('RJ_HISTOGRAM.csv');
NB_HISTOGRAM=dlmread('NB_HISTOGRAM.csv');
WB_HISTOGRAM=dlmread('WB_HISTOGRAM.csv');



%% Plot Power Profiles
figure(1)
clf
hold on
plot([1:length(RJPP)]./60,RJPP./1000000,'Color',[0 .5 0],'LineWidth',3)
plot([1:length(NBPP)]./60,NBPP./1000000,'b','LineWidth',3)
plot([1:length(WBPP)]./60,WBPP./1000000,'r','LineWidth',3)
set(gca,'FontSize',20,'FontWeight','Bold','FontName','Georgia')
xlim([-10 length(WBPP)./60+15])
ylim([0,max(WBPP./1000000)+15])
xticks([0:60:length(WBPP)./60])
legend({"Regional","Narrow Body", "Wide Body"},'FontSize',25,'FontName','georgia','Position',[.8,.65,.1,.1])
xlabel("Time, [Min]",'FontSize',25,'FontName','Georgia','FontWeight','Bold')
ylabel("Required Power, [MW]",'FontSize',25,'FontName','Georgia','FontWeight','Bold')
cruise={"Cruise","\gamma=0","V=V_{minenergy}"};
climb={"Climb","\gamma>0","V=V_{minpower}"};
descend={"Descent","\gamma<0","V=V_{minenergy}"};
annotation('textbox',[.35 .62 .3 .3],'String',cruise,'FontName','Palatino','FontSize',25,'FitBoxToText','on','LineWidth',3,'HorizontalAlignment','center','BackgroundColor','w','FontWeight','Bold')
annotation('textbox',[0.02 .62 .3 .3],'String',climb,'FontName','Palatino','FontSize',25,'FitBoxToText','on','LineWidth',3,'HorizontalAlignment','center','BackgroundColor','w','FontWeight','Bold')
annotation('textbox',[0.7 .62 .3 .3],'String',descend,'FontName','Palatino','FontSize',25,'FitBoxToText','on','LineWidth',3,'HorizontalAlignment','center','BackgroundColor','w','FontWeight','Bold')

%% Histograms
figure(2)
clf
bw=10;
histogram(RJ_HISTOGRAM,'FaceColor',[0 0.5 0],'Normalization','probability','FaceAlpha',1,'NumBins',50,'BinWidth',bw)
hold on
histogram(NB_HISTOGRAM,'FaceColor',[0 0 1],'Normalization','probability','FaceAlpha',1,'NumBins',50,'BinWidth',bw)
histogram(WB_HISTOGRAM,'FaceColor',[1 0 0],'Normalization','probability','FaceAlpha',1,'NumBins',50,'BinWidth',bw)
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
legend({"Regional","Narrow Body","Wide Body"},'FontSize',20,'FontName','Palatino','FontWeight','Bold')
xlabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',25)
ylabel("Normalized Count",'FontName','Palatino','FontWeight','Bold','FontSize',25)

%% Contours
sern=200:25:1200;
ewf=.35:.01:.55;
sewb=200:50:2200;

RJpassengers=dlmread('Data/RJ_PAX.csv');
RJrange=dlmread('Data/RJ_RANGE.csv');
NBpassengers=dlmread('Data/NB_PAX.csv');
NBrange=dlmread('Data/NB_RANGE.csv');
WBpassengers=dlmread('Data/WB_PAX.csv');
WBrange=dlmread('data/WB_RANGE.csv');

figure(3)
clf

subplot(2,3,1);
contourf(ewf,sern,RJpassengers');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Regional Passengers",'FontSize',22)
colorbar;

subplot(2,3,2);
contourf(ewf,sern,NBpassengers');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Narrow Body Passengers",'FontSize',22)
colorbar;

subplot(2,3,3)
contourf(ewf,sewb,WBpassengers');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Wide Body Passengers",'FontSize',22)
colorbar;

subplot(2,3,4);
contourf(ewf,sern,RJrange');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Regional Range, [NMi]",'FontSize',22)
colorbar;

subplot(2,3,5);
contourf(ewf,sern,NBrange');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Narrow Body Range, [NMi]",'FontSize',22)
colorbar;


subplot(2,3,6);
contourf(ewf,sewb,WBrange');
set(gca,'FontSize',18,'FontName','Palatino','FontWeight','Bold')
xlabel("Empty Weight Fraction",'FontName','Palatino','FontWeight','Bold','FontSize',22);
ylabel("Specific Energy, [^{Wh}/_{Kg}]",'FontName','Palatino','FontWeight','Bold','FontSize',22);
title("Wide Body Range, [NMi]",'FontSize',22)
colorbar;
