clear
close all
% load contours.mat
%load('MyColormap.mat')

l_path = pwd;
RJRange = csvread(['Data/RJ_RANGE.csv'],0,0); 
NBRange = csvread(['Data/NB_RANGE.csv'],0,0); 
WBrange = csvread(['Data/WB_RANGE.csv'],0,0); 
RJPassengers = csvread(['Data/RJ_PAX.csv'],0,0); 
NBPassengers = csvread(['Data/NB_PAX.csv'],0,0); 
WBpassengers = csvread(['Data/WB_PAX.csv'],0,0); 

ewf = linspace(0.35,0.55,21);
spen = linspace(200,2200,41);

RJRange(RJRange<300) = NaN;
NBRange(NBRange<300) = NaN;
WBrange(WBrange<300) = NaN;

RJPassengers(RJPassengers<50) =NaN;
NBPassengers(NBPassengers<100) =NaN;
WBpassengers(WBpassengers<100) =NaN;

pnmiRJ= 107059.3684;
pnmiNB= 546183;
pnmiWB= 2323267;

rangeRJ= 1560;
rangeNB=3179;
rangeWB= 6243;


figure()
ax1 = subplot(2,3,1);
contourf(ewf,spen,RJRange'.*100./rangeRJ)
pcolor(ewf,spen,RJRange'.*100./rangeRJ)
shading interp
colormap(ax1, othercolor('RdYlGn4'))
hold on
[a,b] = contour(ewf,spen,RJRange'.*100./rangeRJ,'ShowText','on','LineWidth',3,'LevelStep',20,'Lines','-','LineColor','k');
clabel(a,b,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);%,'YTick',[0,0.1,0.2,0.3,0.4]);
% xlabel('Empty Weight Fraction','FontName','Palatino','FontSize',22)
ylabel('Specific Energy, [Wh/kg]')
text(0.45,400,'Regional','FontName','Palatino','FontSize',22,'FontWeight','bold')
% get(gca, 'Position')

ax2 = subplot(2,3,2);
contourf(ewf,spen,NBRange'.*100./rangeNB)
pcolor(ewf,spen,NBRange'.*100./rangeNB)
shading interp
colormap(ax2,othercolor('RdYlGn4'))
hold on
[a,b] = contour(ewf,spen,NBRange'.*100./rangeNB,'ShowText','on','LineWidth',3,'LevelStep',10,'Lines','-','LineColor','k');
clabel(a,b,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);%,'YTick',[0,0.1,0.2,0.3,0.4]);
set(gca,'YTickLabel',[])%'YTick',[],
text(0.45,400,'Narrow-Body','FontName','Palatino','FontSize',22,'FontWeight','bold')
xlabel('Empty Weight Fraction')
title('Fraction of Current Average Range Achieved, [%]')
% ylabel('Specific Energy, [Wh/kg]','FontName','Palatino','FontSize',22)
% get(gca, 'Position')

WBrange(WBrange<300) = NaN;
ax3 = subplot(2,3,3);
contourf(ewf,spen,WBrange'.*100./rangeWB)
pcolor(ewf,spen,WBrange'.*100./rangeWB)
colormap(ax3,othercolor('RdYlGn4'))
shading interp
hold on
[c,d] = contour(ewf,spen,WBrange'.*100./rangeWB,'ShowText','on','LineWidth',3,'LevelStepMode','manual','LevelStep',5,'Lines','-','LineColor','k');
clabel(c,d,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);
set(gca,'YTickLabel',[])%'YTick',[],
text(0.45,400,'Wide-Body','FontName','Palatino','FontSize',22,'FontWeight','bold')
text(0.555,2100,'(a)','FontName','Palatino','FontSize',22,'FontWeight','bold')
% xlabel('Empty Weight Fraction','FontName','Palatino','FontSize',22)
% ylabel('Specific Energy, [Wh/kg]','FontName','Palatino','FontSize',22)
% get(gca, 'Position')
hold off

ax4 = subplot(2,3,4);
contourf(ewf,spen,RJPassengers'.*RJRange'.*100./pnmiRJ)
pcolor(ewf,spen,RJPassengers'.*RJRange'.*100./pnmiRJ)
shading interp
colormap(ax4,othercolor('RdYlGn4'))
hold on
[a,b] = contour(ewf,spen,RJPassengers'.*RJRange'.*100./pnmiRJ,'ShowText','on','LineWidth',3,'LevelStep',25,'Lines','-','LineColor','k');
clabel(a,b,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);%,'YTick',[0,0.1,0.2,0.3,0.4]);
% xlabel('Empty Weight Fraction','FontName','Palatino','FontSize',22)
text(0.45,400,'Regional','FontName','Palatino','FontSize',22,'FontWeight','bold')
ylabel('Specific Energy, [Wh/kg]')
% get(gca, 'Position')

ax5 = subplot(2,3,5);
contourf(ewf,spen,NBPassengers'.*NBRange'.*100./pnmiNB)
pcolor(ewf,spen,NBPassengers'.*NBRange'.*100./pnmiNB)
shading interp
colormap(ax5,othercolor('RdYlGn4'))
hold on
[a,b] = contour(ewf,spen,NBPassengers'.*NBRange'.*100./pnmiNB,'ShowText','on','LineWidth',3,'LevelStep',10,'Lines','-','LineColor','k');
clabel(a,b,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);%,'YTick',[0,0.1,0.2,0.3,0.4]);
set(gca,'YTickLabel',[])%'YTick',[],
xlabel('Empty Weight Fraction')
text(0.45,400,'Narrow-Body','FontName','Palatino','FontSize',22,'FontWeight','bold')
title('Fraction of Current Average Passenger-Miles Achieved, [%]')
% ylabel('Specific Energy, [Wh/kg]','FontName','Palatino','FontSize',22)
% get(gca, 'Position')

WBrange(WBrange<300) = NaN;
ax6 = subplot(2,3,6);
contourf(ewf,spen,WBpassengers'.*WBrange'.*100./pnmiWB);
pcolor(ewf,spen,WBpassengers'.*WBrange'.*100./pnmiWB)
shading interp
colormap(ax6,othercolor('RdYlGn4'))
hold on
[c,d] = contour(ewf,spen,WBpassengers'.*WBrange'.*100./pnmiWB,'ShowText','on','LineWidth',3,'LevelStepMode','manual','LevelStep',4,'Lines','-','LineColor','k');
clabel(c,d,'FontSize',22,'fontweight','bold','Fontname','Palatino','labelspacing',150,'color','k')
caxis([0 100])
% c = colorbar;
% c.Label.String = 'Range';
% c.Label.FontSize = 23;
% c.LineWidth = 1.5;
set(gcf,'color','w','Position', [15000, 0, 1400, 760])
h = set(gca,'FontName','Palatino','FontSize',22,'FontWeight','bold','LineWidth',1.75,'Fontname','Palatino',...
    'layer','top','TickDir','in','TickLength', [.02 .1]);
text(0.45,400,'Wide-Body','FontName','Palatino','FontSize',22,'FontWeight','bold')
text(0.555,2100,'(b)','FontName','Palatino','FontSize',22,'FontWeight','bold')
set(gca,'YTickLabel',[])%'YTick',[],
% xlabel('Empty Weight Fraction','FontName','Palatino','FontSize',22)
% ylabel('Specific Energy, [Wh/kg]','FontName','Palatino','FontSize',22)
% get(gca, 'Position')

p = subplot(2,3,1);
set(p, 'Position',[0.13    0.5838    0.2134    0.3412])
p = subplot(2,3,2);
set(p, 'Position',[0.39    0.5838    0.2134    0.3412])
p = subplot(2,3,3);
set(p, 'Position',[0.65    0.5838    0.2134    0.3412])
p = subplot(2,3,4);
set(p, 'Position',[0.13    0.0900    0.2134    0.3412])
p = subplot(2,3,5);
set(p, 'Position',[0.39    0.0900    0.2134    0.3412])
p = subplot(2,3,6);
set(p, 'Position',[0.65    0.0900    0.2134    0.3412])

print(gcf,'-painters','-dpng','contours.png')
