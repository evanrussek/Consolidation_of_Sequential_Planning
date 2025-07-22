partList        = [1 2 3 4 5 6 9 10 11 12 14 15 18 19 20 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36];

load('behav_data');

 D = D(D.trial_accept>=0,:);


for s=1:30;
     DD  = D(D.ID==partList(s),:);
     DD0 = DD(DD.run==0,:);
     DD1 = DD(DD.run==1,:);
    FIT1 = fitglme(DD,'trial_accept ~ (MB_P+SRe_P)','Distribution','binomial');

fi=fixedEffects(FIT1);
MB(s)=fi(2);
SR(s)=fi(3);

FIT1 = fitglme(DD0,'trial_accept ~ (MB_P+SRe_P)','Distribution','binomial');

fi=fixedEffects(FIT1);
MB0(s)=fi(2);
SR0(s)=fi(3);

FIT1 = fitglme(DD1,'trial_accept ~ (MB_P+SRe_P)','Distribution','binomial');

fi=fixedEffects(FIT1);
MB1(s)=fi(2);
SR1(s)=fi(3);

FIT1 = fitglme(DD,'rt ~ (NEW)','Distribution','gaussian');
fi=fixedEffects(FIT1);
MBrt(s)=fi(2);

FIT1 = fitglme(DD,'rt ~ (OLD)','Distribution','gaussian');
fi=fixedEffects(FIT1);
SRrt(s)=fi(2);

FIT1 = fitglme(DD,'trial_accept ~ (MB_P+SRe_P)','Distribution','binomial');
FIT1 = fitglme(DD,'trial_accept ~ (MB_P+SRe_P)*run','Distribution','binomial');

fi=fixedEffects(FIT1);

 MBd(s)=fi(5);
 SRd(s)=fi(6);

end

li1=find(MB>median(MB));
li2=find(MB<median(MB));


   D.group(:)=-1;
for w=1:size(D,1);
 for k=1:size(li1,2);
     if D.ID(w)==partList(li1(k));
    D.group(w)=1;
end
      end
end

for w=1:size(D,1);
 for k=1:size(li2,2);
     if D.ID(w)==partList(li2(k));
    D.group(w)=2;
end
      end
 end

 Da=D(D.group>-1,:);

 Da.group2= (Da.group-2)*(-1);

%%


   D1 = D(D.group==1,:);
   D2 = D(D.group==2,:);

  D1x1 = D1(D1.NEW==1,:);
  D1x2 = D1(D1.NEW==2,:);
  D1x3 = D1(D1.NEW==3,:);
  D2x1 = D2(D2.NEW==1,:);
  D2x2 = D2(D2.NEW==2,:);
  D2x3 = D2(D2.NEW==3,:);

FITs = fitglme(D1x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1(1,1)=STATS.Estimate;
G1(1,2)=STATS.SE;

FITs = fitglme(D1x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1(2,1)=STATS.Estimate;
G1(2,2)=STATS.SE;

FITs = fitglme(D1x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1(3,1)=STATS.Estimate;
G1(3,2)=STATS.SE;

FITs = fitglme(D2x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2(1,1)=STATS.Estimate;
G2(1,2)=STATS.SE;



FITs = fitglme(D2x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2(2,1)=STATS.Estimate;
G2(2,2)=STATS.SE;

FITs = fitglme(D2x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2(3,1)=STATS.Estimate;
G2(3,2)=STATS.SE;

G1=G1/1000;
G2=G2/1000;





B=D(D.run==0,:);
 
   D1 = B(B.group==1,:);
   D2 = B(B.group==2,:);

  D1x1 = D1(D1.NEW==1,:);
  D1x2 = D1(D1.NEW==2,:);
  D1x3 = D1(D1.NEW==3,:);
  D2x1 = D2(D2.NEW==1,:);
  D2x2 = D2(D2.NEW==2,:);
  D2x3 = D2(D2.NEW==3,:);

FITs = fitglme(D1x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_1(1,1)=STATS.Estimate;
G1_1(1,2)=STATS.SE;

FITs = fitglme(D1x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_1(2,1)=STATS.Estimate;
G1_1(2,2)=STATS.SE;

FITs = fitglme(D1x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_1(3,1)=STATS.Estimate;
G1_1(3,2)=STATS.SE;

FITs = fitglme(D2x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_1(1,1)=STATS.Estimate;
G2_1(1,2)=STATS.SE;



FITs = fitglme(D2x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_1(2,1)=STATS.Estimate;
G2_1(2,2)=STATS.SE;

FITs = fitglme(D2x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_1(3,1)=STATS.Estimate;
G2_1(3,2)=STATS.SE;

G1_1=G1_1/1000;
G2_1=G2_1/1000;




B=D(D.run==1,:);
 
   D1 = B(B.group==1,:);
   D2 = B(B.group==2,:);

  D1x1 = D1(D1.NEW==1,:);
  D1x2 = D1(D1.NEW==2,:);
  D1x3 = D1(D1.NEW==3,:);
  D2x1 = D2(D2.NEW==1,:);
  D2x2 = D2(D2.NEW==2,:);
  D2x3 = D2(D2.NEW==3,:);

FITs = fitglme(D1x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_2(1,1)=STATS.Estimate;
G1_2(1,2)=STATS.SE;

FITs = fitglme(D1x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_2(2,1)=STATS.Estimate;
G1_2(2,2)=STATS.SE;

FITs = fitglme(D1x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G1_2(3,1)=STATS.Estimate;
G1_2(3,2)=STATS.SE;

FITs = fitglme(D2x1,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_2(1,1)=STATS.Estimate;
G2_2(1,2)=STATS.SE;



FITs = fitglme(D2x2,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_2(2,1)=STATS.Estimate;
G2_2(2,2)=STATS.SE;

FITs = fitglme(D2x3,'rt ~ 1+(1|ID)','Distribution','gaussian');
[BETA,BETANAMES,STATS] = fixedEffects(FITs);
G2_2(3,1)=STATS.Estimate;
G2_2(3,2)=STATS.SE;

G1_2=G1_2/1000;
G2_2=G2_2/1000;


%%


% Convert hexadecimal color #111c4 to RGB values
hexColor = '#1111c4';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors = [redValue, greenValue, blueValue];
barColors1 = [redValue, greenValue, blueValue];

hexColor = '#d5002c';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors(2,:) = [redValue, greenValue, blueValue];
barColors2 = [redValue, greenValue, blueValue];

hexColor = '#5252ef';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors = [redValue, greenValue, blueValue];
barColors1a = [redValue, greenValue, blueValue];

hexColor = '#fe4369';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors(2,:) = [redValue, greenValue, blueValue];
barColors2a = [redValue, greenValue, blueValue];

hexColor = '#0b0b82';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors = [redValue, greenValue, blueValue];
barColors1b = [redValue, greenValue, blueValue];

hexColor = '#8e001d';
redValue = hex2dec(hexColor(2:3)) / 255;   % R component
greenValue = hex2dec(hexColor(4:5)) / 255; % G component
blueValue = hex2dec(hexColor(6:7)) / 255;  % B component
barColors(2,:) = [redValue, greenValue, blueValue];
barColors2b = [redValue, greenValue, blueValue];


defaultColorOrder = get(groot, 'DefaultAxesColorOrder');

% Access the RGB values of the fourth color (typically magenta)


barColors0 = defaultColorOrder(4, :);
barColors1 = [0 0.4470 0.7410];
barColors2 = [0.8500 0.3250 0.0980];

M_MB_A=mean(MB);
M_SR_A=mean(SR);

M_MB_1=mean(MB(li1));
M_SR_1=mean(SR(li1));
M_MB_2=mean(MB(li2));
M_SR_2=mean(SR(li2));

M_MB1_1=mean(MB0(li1));
M_SR1_1=mean(SR0(li1));
M_MB1_2=mean(MB0(li2));
M_SR1_2=mean(SR0(li2));
M_MB2_1=mean(MB1(li1));
M_SR2_1=mean(SR1(li1));
M_MB2_2=mean(MB1(li2));
M_SR2_2=mean(SR1(li2));


S_MB_A=std(MB)/sqrt(30);
S_SR_A=std(SR)/sqrt(30);

S_MB_1=std(MB(li1))/sqrt(15);
S_SR_1=std(SR(li1))/sqrt(15);
S_MB_2=std(MB(li2))/sqrt(15);
S_SR_2=std(SR(li2))/sqrt(15);

S_MB1_1=std(MB0(li1))/sqrt(15);
S_SR1_1=std(SR0(li1))/sqrt(15);
S_MB1_2=std(MB0(li2))/sqrt(15);
S_SR1_2=std(SR0(li2))/sqrt(15);
S_MB2_1=std(MB1(li1))/sqrt(15);
S_SR2_1=std(SR1(li1))/sqrt(15);
S_MB2_2=std(MB1(li2))/sqrt(15);
S_SR2_2=std(SR1(li2))/sqrt(15);

% Sample data for bar plot
groups = {'MB      SR', 'MB      SR', 'MB      SR'};
values = [M_MB_A, M_SR_A M_MB_1, M_SR_1 M_MB_2, M_SR_2];  % Each row represents a group, each column represents a bar
errors = [S_MB_A, S_SR_A S_MB_1, S_SR_1 S_MB_2, S_SR_2];  % Error bars for each bar


% Sample data for bar plot
groups2 = {'Sequential Planners, D1', 'Sequential Planners, D7', 'Non-Sequential Planners, D1', 'Non-Sequential Planners, D7'};
groups2 = {'MB    SR', 'MB    SR', 'MB    SR', 'MB    SR'};

% values2 = [1, 2; 3, 4; 5, 6; 7, 8];  % Each row represents a group, each column represents a bar
% errors2 = [0.1, 0.2; 0.1, 0.2; 0.1, 0.2; 0.1, 0.2];  % Error bars for each bar

values2 = [M_MB1_1 M_SR1_1 M_MB2_1 M_SR2_1 M_MB1_2 M_SR1_2 M_MB2_2 M_SR2_2];  % Each row represents a group, each column represents a bar
errors2 = [S_MB1_1 S_SR1_1 S_MB2_1 S_SR2_1 S_MB1_2, S_SR1_2 S_MB2_2 S_SR2_2];  % Error bars for each bar
set(gca, 'FontSize', 12);


% Create a 2x3 grid of subplots
f = figure;  
f.Position = [50 50 1100 600]; 

% Combined subplot in position 1:2
subplot(2, 3, [1, 2]);

x=[.86,1.14,1.86,2.14,2.86,3.14];

%text(2.31,1.72, '***', 'FontSize', 12, 'FontWeight', 'bold');



% Create a bar plot with error bars
h(1) = bar(x(1),values(1),.25, 'EdgeColor', 'none');
hold on
h(2) = bar(x(2),values(2),.25, 'EdgeColor', 'none');
h(3) = bar(x(3),values(3),.25, 'EdgeColor', 'none');
h(4) = bar(x(4),values(4),.25, 'EdgeColor', 'none');
h(5) = bar(x(5),values(5),.25, 'EdgeColor', 'none');
h(6) = bar(x(6),values(6),.25, 'EdgeColor', 'none');

cmap = parula(20);
col1=cmap(3,:);

options.color_area = col1; % Blue theme
options.color_line = col1;


cmap = parula(20);
col2=cmap(12,:);
set(gca, 'FontSize', 10, 'FontWeight', 'bold')

ax = gca;
ax.YAxis.FontWeight='normal'; % Font size 12


set(h(1), 'FaceColor', barColors2);
set(h(2), 'FaceColor', barColors2);
set(h(3), 'FaceColor', col1);
set(h(4), 'FaceColor', col1);
set(h(5), 'FaceColor', col2);
set(h(6), 'FaceColor', col2);


%h = bar(values, 'EdgeColor', 'none', 'FaceColor', 'flat', 'CData', barColors);


hold on;
for i = 1:6
    errorbar(x(i), values(i), errors(i), 'k.', 'LineWidth', 1);
end

axis([.5, 3.5, 0 1.8])
title('Both Days', 'FontSize', 12, 'FontWeight', 'bold');

clear text

% Customize the plot
xticks(1:numel(groups));
xticklabels(groups);

ax = gca; % Get current axes handle
ax.XMinorTick = 'off'; % Turn off minor tick marks


% line([1.86, 2.86], [1.6, 1.6], 'Color', 'k', 'LineWidth', 1);
% line([2.36, 2.36], [1.6, 1.7], 'Color', 'k', 'LineWidth', 1);
% text(2.31,1.72, '***', 'FontSize', 12, 'FontWeight', 'bold');


%title('Bar Plot with Error Bars');
ylabel('Mean beta estimates','fontsize',10, 'fontweight', 'bold');
legend('Everyone','', 'Sequential Planners (SPs)','','Non-Sequential Planners (nSPs)','','','', 'Location', 'northwest', 'FontSize', 10, 'FontWeight', 'normal');
legend('boxoff'); %
box off
%set(gca, 'FontSize', 12);



ylim([0 2.5]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Combined subplot in position 1:2
subplot(2, 3, [4 ,5]);

% Create a bar plot with error bars
%h = bar(values2, 'EdgeColor', 'none');


x=[.86,1.14,1.86,2.14,2.86,3.14,3.86,4.14];
% values2=[1,2,3,4,3,2,3,2];
% errors2=[.2 .2 .2 .2 .2 .2 .2 .2];

values2=values2';
values2=values2(:);
errors2=errors2';
errors2=errors2(:);

h(1) = bar(.86,values2(1),.25, 'EdgeColor', 'none');
hold on
h(2) = bar(1.14,values2(2),.25, 'EdgeColor', 'none');
h(3) = bar(1.86,values2(3),.25, 'EdgeColor', 'none');
h(4) = bar(2.14,values2(4),.25, 'EdgeColor', 'none');
h(5) = bar(2.86,values2(5),.25, 'EdgeColor', 'none');
h(6) = bar(3.14,values2(6),.25, 'EdgeColor', 'none');
h(7) = bar(3.86,values2(7),.25, 'EdgeColor', 'none');
h(8) = bar(4.14,values2(8),.25, 'EdgeColor', 'none');

cmap = parula(20);
col1=cmap(3,:);

cmap = parula(20);
col1a=cmap(2,:);

cmap = parula(20);
col1b=cmap(4,:);



cmap = parula(20);
col2=cmap(12,:);

cmap = parula(20);
col2a=cmap(11,:);

cmap = parula(20);
col2b=cmap(13,:);


set(h(1), 'FaceColor', col1);
set(h(2), 'FaceColor', col1);
set(h(3), 'FaceColor', col1);
set(h(4), 'FaceColor', col1);
set(h(5), 'FaceColor', col2);
set(h(6), 'FaceColor', col2);
set(h(7), 'FaceColor', col2);
set(h(8), 'FaceColor', col2);


hold on;
for i = 1:8
    %x = h(i).XData + h(i).XOffset;
    errorbar(x(i), values2( i), errors2( i), 'k.', 'LineWidth', 1);
end
axis([.5, 4.5, 0 2.5])

box off
xline(2.5, '--k','LineWidth',2);
% Customize the plot
xticks(1:numel(groups2));
xticklabels(groups2);

ax = gca; % Get current axes handle
ax.XMinorTick = 'off'; % Turn off minor tick marks

set(gca, 'XTick', []);
set(gca, 'FontSize', 10, 'FontWeight', 'bold')
ax = gca;
ax.YAxis.FontWeight='normal'; % Font size 12

%custom_x_positions = [1.5, 3.5, 5.5, 7.5, 9.5]; % Example custom positions
custom_x_positions = [1 2 3 4]; % Example custom positions
xticks(custom_x_positions);


%title('Bar Plot with Error Bars 2');
ylabel('Mean beta estimates');

text(.88, 2.6, 'Day 1', 'FontSize', 12, 'FontWeight', 'bold');
text(1.88, 2.6, 'Day 7', 'FontSize', 12, 'FontWeight', 'bold');
text(2.88, 2.6, 'Day 1', 'FontSize', 12, 'FontWeight', 'bold');
text(3.88, 2.6, 'Day 7', 'FontSize', 12, 'FontWeight', 'bold');


% text(.88, -0.4, 'Day 1', 'FontSize', 12, 'FontWeight', 'bold');
% text(1.88, -0.4, 'Day 7', 'FontSize', 12, 'FontWeight', 'bold');
% text(2.88, -0.4, 'Day 1', 'FontSize', 12, 'FontWeight', 'bold');
% text(3.88, -0.4, 'Day 7', 'FontSize', 12, 'FontWeight', 'bold');

% line([.86, 1.86], [2.1, 2.1], 'Color', 'k', 'LineWidth', 1);
% line([1.36, 1.36], [2.1, 2.2], 'Color', 'k', 'LineWidth', 1);
% text(1.29,2.25, '***', 'FontSize', 12, 'FontWeight', 'bold');

legend('SPs','','','', 'nSPs','','','', 'Location', 'northwest', 'FontSize', 10, 'FontWeight', 'normal');
legend('boxoff'); %



% h=legend('MB D1', 'MB D7','SR D1', 'SR D7', 'Location', 'southoutside', 'Orientation', 'horizontal');
% set(h,'fontsize',10)
%legend('boxoff'); %


%set(gca, 'FontSize', 12);


hold off




% Subplots 3, 4, 5, and 6 (you can add your own data and titles here)
subplot(2, 3, 3);
% Add your plot for position 3 here


h=errorbar([1:3],G1(:,1),G1(:,2))
set(h, 'LineWidth', 2); 
set(h, 'Color', col1); 

hold on
h=errorbar([1:3],G2(:,1),G2(:,2))
set(h, 'LineWidth', 2); 
set(h, 'Color', col2); 


set(gca, 'FontSize', 10, 'FontWeight', 'bold')
ax = gca;
ax.YAxis.FontWeight='normal'; % Font size 12
ax.XAxis.FontWeight='normal'; % Font size 12


%text(2.3,3.3, '***', 'FontSize', 12, 'FontWeight', 'bold');

%title(['Reaction time as function of planning depth'],'fontsize',12)
%subtitle('for MB and SR participants','fontsize',14)
xlabel('Planning depth ','fontsize',10)
ylabel('Reaction time (s)','fontsize',10)
legend('SPs','nSPs','fontsize',10, 'Location','Northwest','FontWeight','normal')
%legend('MB participants','SR participants','fontsize',12,'Location','southoutside','Orientation', 'Horizontal')

legend('boxoff'); %

xlim([.5 3.5]);
ylim([2.5 4]);

set(gca, 'XTick', [1, 2, 3]);
box off

hold off


ah = subplot(2, 3, 6);

% Add your plot for position 6 here


h1=errorbar([1:3],G1_1(:,1),G1_2(:,2),':')
set(h1, 'LineWidth', 2); 
set(h1, 'Color', col1a); 

hold on
h2=errorbar([1:3],G2_1(:,1),G2_2(:,2),':')
set(h2, 'LineWidth', 2); 
set(h2, 'Color', col2a); 


h3=errorbar([1:3],G1_2(:,1),G2_2(:,2),'-.')
set(h3, 'LineWidth', 2); 
set(h3, 'Color', col1b); 


h4=errorbar([1:3],G2_2(:,1),G2_2(:,2),'-.')
set(h4, 'LineWidth', 2); 
set(h4, 'Color', col2b); 



set(gca, 'FontSize', 10, 'FontWeight', 'bold')
ax = gca;
ax.YAxis.FontWeight='normal'; % Font size 12
ax.XAxis.FontWeight='normal'; % Font size 12


%text(2.3,3.3, '***', 'FontSize', 12, 'FontWeight', 'bold');

%title(['Reaction time as function of planning depth'],'fontsize',12)
%subtitle('for MB and SR participants','fontsize',14)
xlabel('Planning depth ','fontsize',10)
ylabel('Reaction time (s)','fontsize',10)
%legend('SPs','nSPs','fontsize',12, 'Location','Northw')

lh = legend(ah, [h1 h2 h3 h4], 'SPs D1','nSPs D1', 'SPs D7','nSPs D7','fontsize',10, 'Location','Northwest','FontWeight','normal');

%legend('MB participants','SR participants','fontsize',12,'Location','southoutside','Orientation', 'Horizontal')

legend('boxoff'); %

% ah2 = copyobj( ah, gcf);
% 
% lh2 = legend(ah2, [h3 h4], 'SPs Day 7','nSPs Day 7','fontsize',12, 'Location','Northeast');
% 
% legend('boxoff'); %


xlim([.5 3.5]);
ylim([2.5 4]);

set(gca, 'XTick', [1, 2, 3]);
box off

hold off




annotation('textbox', [0.04, 0.89, 0.1, 0.1], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.61, 0.89, 0.1, 0.1], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.04, 0.41, 0.1, 0.1], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.61, 0.41, 0.1, 0.1], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');


print('figure0.png', '-dpng', '-r2000');

