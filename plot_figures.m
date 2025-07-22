%%plotting the correlation matrices

partList        = [1 2 3 4 5 6 9 10 11 12 14 15 18 19 20 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36];
clear MATS MATSS MATSS3 MATSS0 MATSS1 MATSS3a MMATS0 MMATS1 MMATS2 MMATS3 MMATS4 MMATS5
text='classic_100_all_b50';

gaus=10; %defines the smoothing for images (not used for any stats)
ran=31;
time=5;

in.timeBins = 1;             
in.mode=1;
in.decod=1;

%load data and 2D smooth

dataFolder      = ['D:\Project 1\ChainRL\Functional Localiser Data New\'];

for p           = 1:30 %length(partList)
    p
clear MATS aa

        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING2s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS0 = smoothdata(MATS,2, 'gaussian', gau );
      MATS0 = smoothdata(MATS0,3, 'gaussian', gau );

      clear MATS bb



        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING3s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS1 = smoothdata(MATS,2, 'gaussian', gau );
      MATS1 = smoothdata(MATS1,3, 'gaussian', gau );

      clear MATS bb


        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING4s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS2 = smoothdata(MATS,2, 'gaussian', gau );
      MATS2 = smoothdata(MATS2,3, 'gaussian', gau );

      clear MATS bb

      

              load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING5s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS3 = smoothdata(MATS,2, 'gaussian', gau );
      MATS3 = smoothdata(MATS3,3, 'gaussian', gau );

      clear MATS bb


              load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING6s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS4 = smoothdata(MATS,2, 'gaussian', gau );
      MATS4 = smoothdata(MATS4,3, 'gaussian', gau );

      clear MATS bb


ind=[1:size(MATS0,1)];


for k=1:ran;
      MATSS0(:,k,p)=MATS0(ind,k,k);


end

%these are the matrices to be plotted MMATS0=NvN, MMATS1=NvN-1,
%MMATS2=NvN-2, 3MMATS=NvN-3, MMATS4=NvN-4 with smoothing

MMATS0(:,:,:,p)=MATS0(ind,1:ran,1:ran);
MMATS1(:,:,:,p)=MATS1(ind,1:ran,1:ran);
MMATS2(:,:,:,p)=MATS2(ind,1:ran,1:ran);
MMATS3(:,:,:,p)=MATS3(ind,1:ran,1:ran);
MMATS4(:,:,:,p)=MATS4(ind,1:ran,1:ran);



end


%load data and no 2D smooth (for stats etc)

gaus=.0001;
ran=31;
time=5;

dataFolder      = ['D:\Project 1\ChainRL\Functional Localiser Data New\'];

for p           = 1:30 %length(partList)
    p
clear MATS aa


       % load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING1s_0-20' int2str(in.decod)  '.mat']);


        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING2s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS0 = smoothdata(MATS,2, 'gaussian', gau );
      MATS0 = smoothdata(MATS0,3, 'gaussian', gau );

      clear MATS bb



        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING3s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS1 = smoothdata(MATS,2, 'gaussian', gau );
      MATS1 = smoothdata(MATS1,3, 'gaussian', gau );

      clear MATS bb


        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING4s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS2 = smoothdata(MATS,2, 'gaussian', gau );
      MATS2 = smoothdata(MATS2,3, 'gaussian', gau );

      clear MATS bb

      

              load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING5s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS3 = smoothdata(MATS,2, 'gaussian', gau );
      MATS3 = smoothdata(MATS3,3, 'gaussian', gau );

      clear MATS bb


              load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING6s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS4 = smoothdata(MATS,2, 'gaussian', gau );
      MATS4 = smoothdata(MATS4,3, 'gaussian', gau );

      clear MATS bb


%ind=indp001;

ind=[1:size(MATS0,1)];


for k=1:ran;
      MATSS0g(:,k,p)=MATS0(ind,k,k);

end

%these are the matrices to be plotted MMATS0=NvN, MMATS1=NvN-1,
%MMATS2=NvN-2, 3MMATS=NvN-3, MMATS4=NvN-4 without smoothing

MMATS0g(:,:,:,p)=MATS0(ind,1:ran,1:ran);
MMATS1g(:,:,:,p)=MATS1(ind,1:ran,1:ran);
MMATS2g(:,:,:,p)=MATS2(ind,1:ran,1:ran);
MMATS3g(:,:,:,p)=MATS3(ind,1:ran,1:ran);
MMATS4g(:,:,:,p)=MATS4(ind,1:ran,1:ran);
end


%%



load('behav_data');

 D = D(D.trial_accept>=0,:);

for s=1:30;
     DD = D(D.ID==partList(s),:);


FIT1 = fitglme(DD,'trial_accept ~ (MB_P+SRe_P)','Distribution','binomial');

fi=fixedEffects(FIT1);
MB(s)=fi(2);

end


li1=find(MB>median(MB));
li2=find(MB<median(MB));







barColors1 = [0 0.4470 0.7410];
barColors2 = [0.8500 0.3250 0.0980];


% this section will plot the 2 d plots for 0, 1 2 3 4+



figureHandle=figure(1)


figureHandle = figure;  

sgtitle('Both Days', 'fontweight', 'bold')

figureHandle.Position = [50 50 975 1190]; 


subplotPos1 = [0.05 0.5 0.4 0.4];

subplotPos1 = [0.05 0.52 0.35 0.33];
subplotPos2 = [0.46 0.52 0.4 0.33];
subplotPos3 = [0.05 0.1 0.35 0.33];
subplotPos4 = [0.46 0.1 0.4 0.33];



list=[li1];
range=[0:0.1:3];
led=[-3:0.1:3];
le=31;
MMm=squeeze(nanmean(MMATS0,1));
MM=squeeze(nanmean(MMm(:,:,list),3));
%figure(1)
%subplot(2,2,1)
%ax1 = subplot('Position', subplotPos1);
ax1 = subplot(5, 3, 1);

%MM=MM';
ax1 = contourf([0:.1:3],[0:.1:3],MM',9);

colormap parula(10)

set(gca,'FontSize',10)

h = colorbar;
%ylabel(h,'Pattern similarity (Pearson corr.)','fontsize',10)

%colormap turbo
hold on
plot([0:.1:3],[0:.1:3],'-k','LineWidth',.5);

%plot([0:.1:3]*.75,[0:.1:3],'--r','LineWidth',1);

%title('Group Mean','fontsize',18)

xlabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')
title('Sequential Planners','fontsize',12)

set(gca,'YDir','normal')
set(gca,'fontname','helvetica')  % Set it to times

ylabel(h,'correlation coefficient','fontsize',9)

ma=max(max(MM));
mi=min(min(MM));
caxis([mi ma]);
xticks([0 1 2 3])
yticks([0 1 2 3])
hold off

list=[li2 ];
range=[0:0.1:3];
led=[-3:0.1:3];
le=31;
MMm=squeeze(nanmean(MMATS0,1));
MM=squeeze(nanmean(MMm(:,:,list),3));
%figure(1)
%subplot(2,2,1)
%ax1 = subplot('Position', subplotPos2);
ax1 = subplot(5, 3, 2);

%MM=MM';
ax1 = contourf([0:.1:3],[0:.1:3],MM',9);
colormap parula(10)
set(gca,'FontSize',10)
h = colorbar;


%colormap turbo
hold on
plot([0:.1:3],[0:.1:3],'-k','LineWidth',.5);

%plot([0:.1:3]*.75,[0:.1:3],'--r','LineWidth',1);

title('Non-Sequential Planners','fontsize',12)

xlabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')

%ylabel('planning time (s) - starting at n ','fontsize',14)
set(gca,'YDir','normal')
set(gca,'fontname','helvetica')  % Set it to times



caxis([mi ma]);
xticks([0 1 2 3])
yticks([0 1 2 3])

hold off


% n v not n 


list=[li1];
range=[0:0.1:3];
led=[-3:0.1:3];
le=31;
MMm=squeeze(nanmean(MMATS1,1));
MM=squeeze(nanmean(MMm(:,:,list),3));
%figure(1)
%subplot(2,2,1)
%ax1 = subplot('Position', subplotPos3);
ax1 = subplot(5, 3, 4);

MM1=MM;

%MM=MM';
ax1 = contourf([0:.1:3],[0:.1:3],MM',9);
colormap parula(10)
set(gca,'FontSize',10)


%ylabel(h,'Pattern similarity (Pearson corr.)','fontsize',10)

h = colorbar;
ticks = [-0.01 0 .01]; % Example tick locations
set(h, 'Ticks', ticks);

%colormap turbo
hold on
plot([0:.1:3],[0:.1:3],'-k','LineWidth',.5);
plot([1:.1:3],[0:.1:2],':k','LineWidth',1);
plot([0:.1:2],[1:.1:3],'--k','LineWidth',.5);



%plot([0:.1:2.2],[0:.1:2.2]+.8,'--r','LineWidth',1);


xlabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N-1','fontsize',10, 'fontweight', 'bold')
%title('Sequential Planning','fontsize',10)


set(gca,'YDir','normal')
set(gca,'fontname','helvetica')  % Set it to times
ma=max(max(MM));
mi=min(min(MM));
caxis([mi ma]);
xticks([0 1 2 3])
yticks([0 1 2 3])

ylabel(h,'correlation coefficient','fontsize',9)

hold off

list=[li2];
range=[0:0.1:3];
led=[-3:0.1:3];
le=31;
MMm=squeeze(nanmean(MMATS1,1));
MM=squeeze(nanmean(MMm(:,:,list),3));
%figure(1)
%subplot(2,2,1)
%ax1 = subplot('Position', subplotPos4);
ax1 = subplot(5, 3, 5);


%MM=MM';
ax1 = contourf([0:.1:3],[0:.1:3],MM',9);
h = colorbar;

h = colorbar;
ticks = [-0.01 0 .01]; % Example tick locations
set(h, 'Ticks', ticks);


colormap parula(10)

set(gca,'FontSize',10)







%colormap turbo
hold on


plot([0:.1:3],[0:.1:3],'-k','LineWidth',.5);
plot([1:.1:3],[0:.1:2],':k','LineWidth',1);
plot([0:.1:2],[1:.1:3],'--k','LineWidth',.5);

%plot([0:.1:2.2],[0:.1:2.2]+.8,'--r','LineWidth',1);


xlabel('Time (s), Start: N','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N-1','fontsize',10, 'fontweight', 'bold')
%title('No Sequential Planning','fontsize',10)


%ylabel('planning time (s) - starting at n ','fontsize',14)
set(gca,'YDir','normal')
set(gca,'fontname','helvetica')  % Set it to times
% ma=max(max(MM));
% mi=min(min(MM));
caxis([mi ma]);
xticks([0 1 2 3])
yticks([0 1 2 3])


hold off







ax1 = subplot(5, 3, 3);

DAAb=squeeze(mean(MATSS0,1));

fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;

% options.color_area = barColors1; % Blue theme
% options.color_line = barColors1;

cmap = parula(20);
col1=cmap(3,:);

options.color_area = col1; % Blue theme
options.color_line = col1;


cmap = parula(20);
col1=cmap(12,:);

% cmap = parula(20);
% col2=cmap(7,:);


options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval
DAAg=DAAb(:,li1);
%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
plot_areaerrorbar(DAAg(1:31,:)',[0:0.1:3], options);

DDp=DAAg;
hold on;
%DAAb=squeeze(mean(MATSS0db,1));

DAAg=DAAb(:,li2);
DDnp=DAAg;
% options.color_area = barColors2; 
% options.color_line = barColors2;

options.color_area = col1; % Blue theme
options.color_line = col1;


%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
plot_areaerrorbar(DAAg(1:31,:)',[0:0.1:3], options);

hold on
%plot(led(:,11:51),zeros(41,1),'black')
plot(led(:,1:31),zeros(31,1),'black')

box off
set(gca,'fontname','helvetica')  % Set it to times

title('Along zero lag (N vs. N)','fontsize',10)

xlabel('time from trial onset (s)','fontsize',10, 'fontweight', 'bold')
ylabel('Pattern similarity','fontsize',10, 'fontweight', 'bold')
hLegend =legend('SPs','','nSPs','','','fontsize',10,'Location','northeast')
set(hLegend, 'Box', 'off');
xticks(0:1:3);
ylim([0 0.08]);
xlim([0 3]);



box off

hold off




MMm=squeeze(mean(MMATS0,1));
MM=squeeze(mean(MMm(:,:,:),3));
clear DA DAa DAA
clear DAAfd
ac=MMm;
for s=1:30;
for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i,s);
    DAT2=DAT2+ac(i,ii,s);
end
DA(j,s)=DAT/(le-j+1);
DAA(j,s)=DAT2/(le-j+1);


end
end
DAa=DAA;
DAA=flip(DAA,1);
Da1s=DA-DAa;
DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);
DAA0=DAA;



MMm=squeeze(mean(MMATS1,1));
MM=squeeze(mean(MMm(:,:,:),3));
clear DA
clear DAA
ac=MMm;
for s=1:30;
for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i,s);
    DAT2=DAT2+ac(i,ii,s);
end
DA(j,s)=DAT/(le-j+1);
DAA(j,s)=DAT2/(le-j+1);
end
end
DAa=DAA;
DAA=flip(DAA,1);
Da1s=DA-DAa;
DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);
DAA1=DAA;

MMm=squeeze(mean(MMATS2,1));
MM=squeeze(mean(MMm(:,:,:),3));
clear DA
clear DAA
ac=MMm;
for s=1:30;
for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i,s);
    DAT2=DAT2+ac(i,ii,s);
end
DA(j,s)=DAT/(le-j+1);
DAA(j,s)=DAT2/(le-j+1);
end
end
DAa=DAA;
DAA=flip(DAA,1);
Da1s=DA-DAa;
DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);
DAA2=DAA;

MMm=squeeze(mean(MMATS3,1));
MM=squeeze(mean(MMm(:,:,:),3));
clear DA
clear DAA
ac=MMm;
for s=1:30;
for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i,s);
    DAT2=DAT2+ac(i,ii,s);
end
DA(j,s)=DAT/(le-j+1);
DAA(j,s)=DAT2/(le-j+1);
end
end
DAa=DAA;
DAA=flip(DAA,1);
Da1s=DA-DAa;
DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);
DAA3=DAA;

MMm=squeeze(mean(MMATS4,1));
MM=squeeze(mean(MMm(:,:,:),3));
clear DA
clear DAA
ac=MMm;
for s=1:30;
for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i,s);
    DAT2=DAT2+ac(i,ii,s);
end
DA(j,s)=DAT/(le-j+1);
DAA(j,s)=DAT2/(le-j+1);
end
end
DAa=DAA;
DAA=flip(DAA,1);
Da1s=DA-DAa;
DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);
DAA4=DAA;








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


MMM=MMATS1g;

DIi1=zeros(size(MMM,1),61,size(MMM,4));

le=31;


for k=1:size(MMM,1);
    for p=1:size(MMM,4);
clear DA DAA

ac=squeeze(MMM(k,1:31,1:31,p));

for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i);
    DAT2=DAT2+ac(i,ii);
end
DA(j)=DAT/(le-j+1);
DAA(j)=DAT2/(le-j+1);
end

DA=DA';
DAA=DAA';

DAa=DAA;
DAA=flip(DAA,1);

DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);


DIi1(k,:,p)=DAA;

    end
end




MMM=MMATS2g;


DIi2=zeros(size(MMM,1),61,size(MMM,4));

le=31;


for k=1:size(MMM,1);
    for p=1:size(MMM,4);
clear DA DAA

ac=squeeze(MMM(k,1:31,1:31,p));

for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i);
    DAT2=DAT2+ac(i,ii);
end
DA(j)=DAT/(le-j+1);
DAA(j)=DAT2/(le-j+1);
end

DA=DA';
DAA=DAA';

DAa=DAA;
DAA=flip(DAA,1);

DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);


DIi2(k,:,p)=DAA;

    end
end




MMM=MMATS3g;


DIi3=zeros(size(MMM,1),61,size(MMM,4));

le=31;


for k=1:size(MMM,1);
    for p=1:size(MMM,4);
clear DA DAA

ac=squeeze(MMM(k,1:31,1:31,p));

for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i);
    DAT2=DAT2+ac(i,ii);
end
DA(j)=DAT/(le-j+1);
DAA(j)=DAT2/(le-j+1);
end

DA=DA';
DAA=DAA';

DAa=DAA;
DAA=flip(DAA,1);

DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);


DIi3(k,:,p)=DAA;

    end
end



MMM=MMATS4g;


DIi4=zeros(size(MMM,1),61,size(MMM,4));
le=31;


for k=1:size(MMM,1);
    for p=1:size(MMM,4);
clear DA DAA

ac=squeeze(MMM(k,1:31,1:31,p));

for j=1:le;
DAT=0;
DAT2=0;
for i=j:le;
    ii=i-j+1;
    DAT=DAT+ac(ii,i);
    DAT2=DAT2+ac(i,ii);
end
DA(j)=DAT/(le-j+1);
DAA(j)=DAT2/(le-j+1);
end

DA=DA';
DAA=DAA';

DAa=DAA;
DAA=flip(DAA,1);

DAA(size(DAA,1)+1:size(DAA,1)+size(DA,1)-1,:)=DA(2:le,:);


DIi4(k,:,p)=DAA;

    end
end


for rann=1:61;
rann2=21:30;

DIIi1=squeeze((DIi1(:,rann,:)));
DIIi2=squeeze((DIi2(:,rann,:)));
DIIi3=squeeze((DIi3(:,rann,:)));
DIIi4=squeeze((DIi4(:,rann,:)));


DIIi1234s(:,1)=squeeze(mean(DIIi1,1));
DIIi1234s(:,2)=squeeze(mean(DIIi2,1));
DIIi1234s(:,3)=squeeze(mean(DIIi3,1));
DIIi1234s(:,4)=squeeze(mean(DIIi4,1));


dd=[1 2 3];
%dd=[1  2];

for i=1:size(DIIi1234s,1);


    AAA=[1 1 1 2];
[r]=corr(squeeze(DIIi1234s(i,dd))',[1:size(dd,2)]', 'Type','spearman');
%[r]=corr(squeeze(DIIi1234s(i,dd))',AAA', 'Type','pearson');


AAA=ones(size(dd,2),1);
AAA(:,2)=[1:size(dd,2)]';
% [r] = regress(squeeze(DIIi1234s(i,dd))',AAA);

%[r]=corr(squeeze(DIIi1234_2s(i,dd))',AAA', 'Type','Spearman');


%[r]=squeeze(DIIi1234s(i,dd(2)))-squeeze(DIIi1234s(i,dd(1)));

%RESo(i,rann)=-r(2);
RESo(i,rann)=-r;

end
end

gaus=5;
RESo = smoothdata(RESo,2, 'gaussian', gaus );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% 
% MMm=squeeze(mean(MMATS0,1));
% MM0=squeeze((MMm(5,:,:)));
% 
% MMm=squeeze(mean(MMATS1,1));
% MM1=squeeze((MMm(5,:,:)));
% 
% MMm=squeeze(mean(MMATS2,1));
% MM2=squeeze((MMm(5,:,:)));
% 
% MMm=squeeze(mean(MMATS3,1));
% MM3=squeeze((MMm(5,:,:)));
% 
% MMm=squeeze(mean(MMATS4,1));
% MM4=squeeze((MMm(5,:,:)));
% 
% ax1 = subplot(5, 3, 6);
% 
% 
% errorbar([0:0.1:3],squeeze(mean(MM0(:,li1),2)),squeeze(std(MM0(:,li1),[],2))./sqrt(15))
% hold on
% errorbar([0:0.1:3],squeeze(mean(MM1(:,li1),2)),squeeze(std(MM1(:,li1),[],2))./sqrt(15))
% errorbar([0:0.1:3],squeeze(mean(MM2(:,li1),2)),squeeze(std(MM2(:,li1),[],2))./sqrt(15))
% errorbar([0:0.1:3],squeeze(mean(MM3(:,li1),2)),squeeze(std(MM3(:,li1),[],2))./sqrt(15))
% hold off
% 
% 
% ax1 = subplot(5, 3, 9);
% 
% errorbar([0:0.1:3],squeeze(mean(MM0(:,li2),2)),squeeze(std(MM0(:,li2),[],2))./sqrt(15))
% hold on
% errorbar([0:0.1:3],squeeze(mean(MM1(:,li2),2)),squeeze(std(MM1(:,li2),[],2))./sqrt(15))
% errorbar([0:0.1:3],squeeze(mean(MM2(:,li2),2)),squeeze(std(MM2(:,li2),[],2))./sqrt(15))
% errorbar([0:0.1:3],squeeze(mean(MM3(:,li2),2)),squeeze(std(MM3(:,li2),[],2))./sqrt(15))
% hold off

DAAA0=DAA0(32:61,:)-flip(DAA0(1:30,:))

DAAA1=DAA1(32:61,:)-flip(DAA1(1:30,:))
DAAA2=DAA2(32:61,:)-flip(DAA2(1:30,:))
DAAA3=DAA3(32:61,:)-flip(DAA3(1:30,:))
DAAA4=DAA4(32:61,:)-flip(DAA4(1:30,:))



ax1 = subplot(5, 3, 6);

fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;
% 
% options.color_area = barColors1; % Blue theme
% options.color_line = barColors1;




cmap = parula(20);
col1=cmap(3,:);

options.color_area = col1; % Blue theme
options.color_line = col1;


cmap = parula(20);
col1=cmap(12,:);


options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval
DAAg=DAA1(:,li1);
DBp=DAAg;
%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
plot_areaerrorbar(DAAg(1:61,:)',[-3:0.1:3], options);


hold on;
DAAg=DAA1(:,li2);
DBnp=DAAg;

% options.color_area = barColors2; 
% options.color_line = barColors2;

options.color_area = col1; % Blue theme
options.color_line = col1;
%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
plot_areaerrorbar(DAAg(1:61,:)',[-3:0.1:3], options);

hold on
%plot(led(:,11:51),zeros(41,1),'black')
plot(led(:,1:61),zeros(61,1),'black')

box off
set(gca,'fontname','helvetica')  % Set it to times

rang=[-1:.1:1];
rang2=[-0.01:.001:0.007];

plot(ones(size(rang)),[-1:.1:1],'--k','LineWidth',.25);
plot(zeros(size(rang)),[-1:.1:1],'-k','LineWidth',.25);
plot((-1)*ones(size(rang2)),rang2,':k','LineWidth',.5);

% subtitle('for different lags between start state n and start state n-1','fontsize',14)

xlabel('Lag from start N to N-1','fontsize',10, 'fontweight', 'bold')
ylabel('Dynamic similarity','fontsize',10, 'fontweight', 'bold')
hLegend =legend('SPs','','nSPs','','','fontsize',10,'Location','Northwest')
title('Mean across lags (N vs. N-1)','fontsize',10)


set(hLegend, 'Box', 'off');
xticks(-3:1:3);

ylim([-0.01 0.015]);
yticks(-0.01:0.01:0.01);

xlim([-2 2]);

clear text
%text(0.5,0.005, '***', 'FontSize', 12, 'FontWeight', 'bold');

box off

hold off



%%%%%%%%%%%%%%%%%%%%%%%%%





% figureHandle=figure(12)
% figureHandle.Position = [100 100 1000 1000];

subplotPos1 = [0.05 0.5 0.4 0.4];
%[left bottom width height])
subplotPos1 = [0.10 0.535 0.4 0.33];
subplotPos2 = [0.55 0.535 0.4 0.33];
subplotPos3 = [0.05 0.115 0.4 0.33];
subplotPos4 = [0.46 0.08 0.4 0.4];


ran=11:51;
%ran=1:61;
rans=[-2:0.1:2];
%rans=[-3:0.1:3];

ran=1:61;
%ran=1:61;
rans=[-3:0.1:3];
sii=61;


ax1 = subplot(5, 3, 7);


col1=[0, 0, 255];
col2=[50, 25, 200];
col3=[125, 0, 125];
col4=[191, 0, 63];
col5= [255, 0, 0];



% col1=[0, 0, 255];
% col2=[0, 255, 255];
% col3=[0, 255, 0];
% col4=[191, 0, 63];
% col5= [255, 255, 0];

cmap = parula(10);
disp(cmap);

% col1=cmap(1,:)*255;
% col2=cmap(3,:)*255;
% col3=cmap(5,:)*255;
% col4=cmap(7,:)*255;
% col5=cmap(10,:)*255;

col1=cmap(9,:)*255;
col2=cmap(7,:)*255;
col3=cmap(5,:)*255;
col4=cmap(3,:)*255;
col5=cmap(1,:)*255;

% col1=defaultColorOrder(6, :)*255;
% col2=defaultColorOrder(7, :)*255;
% col3=defaultColorOrder(3, :)*255;
% col4=defaultColorOrder(4, :)*255;
% col5= defaultColorOrder(5, :)*255;

% rans=[0.1:.1:3];
% ran=1:30;

% li1=find(SR>median(SR));
% li2=find(SR<median(SR));

li=li1'

fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;
li
options.color_area =col1./255; 
options.color_line =col1./255;



options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval

DAAg=DAA0(:,li);
%DAAg=DAAA0(:,li);

plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on

options.color_area =col2./255; 
options.color_line =col2./255;

DAAg=DAAA1(:,li);
DAAg=DAA1(:,li);

plot_areaerrorbar(DAAg(ran,:)',rans, options);

hold on;
DAAg=DAAA2(:,li);
DAAg=DAA2(:,li);

options.color_area =col3./255; 
options.color_line =col3./255;

plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on;

DAAg=DAAA3(:,li);
DAAg=DAA3(:,li);

options.color_area =col4./255; 
options.color_line =col4./255;


plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on;

DAAg=DAAA4(:,li);
DAAg=DAA4(:,li);

options.color_area =col5./255; 
options.color_line =col5./255;

plot_areaerrorbar(DAAg(ran,:)',rans, options);

hold on
plot(led(:,ran),zeros(sii,1),'black')

box off
set(gca,'fontname','helvetica')  % Set it to times

%title(['Sequential Planning - Day 7 trials'],'fontsize',16)
% subtitle('for different lags between start state n and start state n-1','fontsize',14)
rngy=32:41;
rngy=21:30;

DAAA(1,:)=squeeze(mean(DAA0(rngy,:)));
DAAA(2,:)=squeeze(mean(DAA1(rngy,:)));
DAAA(3,:)=squeeze(mean(DAA2(rngy,:)));
DAAA(4,:)=squeeze(mean(DAA3(rngy,:)));
DAAA(5,:)=squeeze(mean(DAA4(rngy,:)));

DAAA1=mean(DAAA(:,li1),2);
DAAA2=mean(DAAA(:,li2),2);






xlabel('Lag from start N to...','fontsize',10, 'fontweight', 'bold')
ylabel('Dynamic similarity','fontsize',10, 'fontweight', 'bold')


rang2=[-0.03:.001:0.007];


plot(ones(size(rang)),[-1:.1:1],'--k','LineWidth',.25);
plot(zeros(size(rang)),[-1:.1:1],'-k','LineWidth',.25);
plot((-1)*ones(size(rang2)),rang2,':k','LineWidth',.5);


%hLegend.Position = [0.52, 0.24, 0.01, 0.01];  % Adjust the position as needed
hLegend =legend('N','','N-1','','N-2','','N-3','','N-4','fontsize',8,'Location','northwest')

set(hLegend, 'Box', 'off');
xticks(-2:1:2);

ylim([-0.03 0.06]);
xlim([-2 2]);


box off

hold off



ax1 = subplot(5, 3, 8);


col1=[0, 0, 255];
col2=[63, 25, 191];
col3=[125, 0, 125];
col4=[191, 0, 63];
col5= [255, 0, 10];
% 
% col1=defaultColorOrder(1, :)*255;
% col2=defaultColorOrder(2, :)*255;
% col3=defaultColorOrder(3, :)*255;
% col4=defaultColorOrder(4, :)*255;
% col5= defaultColorOrder(5, :)*255;

cmap = parula(10);
disp(cmap);

% col1=cmap(1,:)*255;
% col2=cmap(3,:)*255;
% col3=cmap(5,:)*255;
% col4=cmap(7,:)*255;
% col5=cmap(10,:)*255;

col1=cmap(9,:)*255;
col2=cmap(7,:)*255;
col3=cmap(5,:)*255;
col4=cmap(3,:)*255;
col5=cmap(1,:)*255;


li=li2'

fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;

options.color_area =col1./255; 
options.color_line =col1./255;

options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval

DAAg=DAA0(:,li);
plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on

options.color_area =col2./255; 
options.color_line =col2./255;

DAAg=DAA1(:,li);
plot_areaerrorbar(DAAg(ran,:)',rans, options);

hold on;

DAAg=DAA2(:,li);
options.color_area =col3./255; 
options.color_line =col3./255;

plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on;

DAAg=DAA3(:,li);

options.color_area =col4./255; 
options.color_line =col4./255;


plot_areaerrorbar(DAAg(ran,:)',rans, options);
hold on;

DAAg=DAA4(:,li);
options.color_area =col5./255; 
options.color_line =col5./255;

plot_areaerrorbar(DAAg(ran,:)',rans, options);

hold on
plot(led(:,ran),zeros(sii,1),'black')

plot(ones(size(rang)),[-1:.1:1],'--k','LineWidth',.25);
plot(zeros(size(rang)),[-1:.1:1],'-k','LineWidth',.25);
plot((-1)*ones(size(rang2)),rang2,':k','LineWidth',.5);
box off
set(gca,'fontname','helvetica')  % Set it to times

%title(['No Sequential Planning - Day 7 trials'],'fontsize',16)
% subtitle('for different lags between start state n and start state n-1','fontsize',14)

xlabel('Lag from start N to...','fontsize',10, 'fontweight', 'bold')

hLegend =legend('N','','N-1','','N-2','','N-3','','N-4','fontsize',8,'Location','northwest')
%text(-1.8,0.05, 'No Sequential Planning', 'FontSize', 10);

%title('No Sequential Planning','fontsize',10)



%ylabel('mean Pattern similarity across dynamic','fontsize',14)
%hLegend =legend('N vs. N','','n-1 vs n','','n-2 vs n','','n-3 vs n','','n-4 vs n','fontsize',14,'Location','northwest')
set(hLegend, 'Box', 'off');
xticks(-2:1:2);
ylim([-0.03 0.06]);
xlim([-2 2]);


box off
hold off







ax1 = subplot(5, 3, 9);

fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;

options.color_area = barColors2; % Blue theme
options.color_line = barColors2;




cmap = parula(20);
cmap = parula(20);
col1=cmap(3,:);

options.color_area = col1; % Blue theme
options.color_line = col1;


cmap = parula(20);
col1=cmap(12,:);


options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval

plot_areaerrorbar(RESo(li1,11:51),[-2:.1:2], options);




hold on;
options.alpha      = 0.7;


% options.color_area = barColors2; 
% options.color_line = barColors2;
options.color_area = col1; % Blue theme
options.color_line = col1;
%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
%plot_areaerrorbar(DAAg(1:31,:)',[0:100/30:100], options);
plot_areaerrorbar(RESo(li2,11:51),[-2:.1:2], options);


hold on
%plot(led(:,11:51),zeros(41,1),'black')
plot(led(:,11:51),zeros(41,1),'black')

box off
set(gca,'fontname','helvetica')  % Set it to times


rang=[-1:.1:1];
rang2=[-0.4:.001:0.45];


plot(ones(size(rang)),[-1:.1:1],'--k','LineWidth',.25);
plot(zeros(size(rang)),[-1:.1:1],'-k','LineWidth',.25);
plot((-1)*ones(size(rang2)),rang2,':k','LineWidth',.5);


%title('Along zero lag (N vs. N)','fontsize',10)

title('nSPs (N vs N, zero lag)','fontsize',10)



xlabel('Lag from start N to N-1, N-2, N-3','fontsize',10, 'fontweight', 'bold')
ylabel('Rank Correlation','fontsize',10, 'fontweight', 'bold')
hLegend =legend('SPs','','nSPs','','','fontsize',10,'Location','northwest')
title('Correlation across lags ','fontsize',10)


% title(hLegend,'No Sequential Planning')
% leg.Title.Visible = 'on';

set(hLegend, 'Box', 'off');
xticks(-3:1:3);
ylim([-0.4 0.8]);
xlim([-2 2]);



box off

hold off


%rt modulation plots


in.timeBins = 1;             
in.mode=1;
in.decod=1;



    text='classic_100_r2_d3_rt_acrossx_control_b20';


ran=31;
time=5;



dataFolder      = ['D:\Project 1\ChainRL\Functional Localiser Data New\'];

for p           = 1:30 %length(partList)
    p
clear MATS aa


        load([dataFolder 'part' int2str(partList(p)) '_funcLocLambda' '4' 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins'  '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING2s_' text int2str(in.decod)  '.mat']);
    MATS(:,:,:) =bb;

      gau=gaus;
      MATS0s = smoothdata(MATS,2, 'gaussian', gau );
      MATS0s = smoothdata(MATS0s,3, 'gaussian', gau );

      clear MATS bb



ind=[1:size(MATS0s,1)];


for k=1:ran;
      MATSS0s(:,k,p)=MATS0s(ind,k,k);

end


MMATS0s(:,:,:,p)=MATS0s(ind,1:ran,1:ran);
end






%sgtitle('Sequential Planning', 'fontweight', 'bold')

clear Du Duu
list1=[1     2     3     4     7     8    11    13    16    18    22    24    25    27    29];
list2=[5     6     9    10    12    14    15    17    19    20    21    23    26    28    30];


list=[ li1];
range=[0:0.1:3];
ra=[1:31];
led=[-3:0.1:3];
le=31;

ang=([15:1:75]);
slopes=tand(ang);

MMm=squeeze(nanmean(MMATS0s,1));


MMm=MMm(ra,ra,:);

        MM=squeeze(nanmean(MMm(:,:,li1),3));
        MM2=squeeze(nanmean(MMm(:,:,li2),3));




clear Duu Duu1 Duu2

raa=[5:31];
for i=1:30;
    i
    for j=1:size(ang,2);
       % Duu(j,i)=averagePixelAlongLine(MMm(:,:,i)',slopes(j),0);
        Duu(j,i)=averagePixelAlongLine(MMm(raa,raa,i)',slopes(j),0);

%         Duu1(j,i)=averagePixelAlongLine(MMm1(raa,raa,i)',slopes(j),0);
% 
%         Duu2(j,i)=averagePixelAlongLine(MMm2(raa,raa,i)',slopes(j),0);

    end
end




ax1 = subplot(5, 3, 10);
fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;

%MM=MM';
%imagesc([0:0.1:3],[0:0.1:3],MM');
ax1 = contourf(range,range,MM',9);
colormap parula(10)


h = colorbar;
ma=max(max(MM));
mi=min(min(MM));
caxis([mi ma]);


xlabel('Time (s), Start: N - fast rt','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N - slow rt','fontsize',10, 'fontweight', 'bold')
set(gca,'YDir','normal')
ylabel(h,'correlation coefficient','fontsize',9)



hold on
%plot([0:0.01:3],[0:0.01:3])
pl = line([.4 max(range)],[.4 max(range)], 'Color', 'k', 'LineStyle', '-', 'LineWidth', .5);

aaa=mean(Duu(:,li1)');
fi=ang(find(aaa==max(aaa)));
xx=3/tand(fi);
fi1=fi;

pl = line([.4 xx],[.4 max(range)], 'Color', 'k', 'LineStyle', '-.', 'LineWidth', .5);
clim([-0.02 0.035]);


hold off


ax1 = subplot(5, 3, 11);
fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;

%MM=MM';
%imagesc([0:0.1:3],[0:0.1:3],MM');
ax1 = contourf(range,range,MM2',9);
colormap parula(10)

h = colorbar;
% ma=max(max(MM2));
% mi=min(min(MM2));
caxis([mi ma]);

%ylabel(h,'Pattern similarity (corr. of voxel values)','fontsize',10)
%caxis([-0.01 .1]);
%title('No Sequential Planning','fontsize',10)

xlabel('Time (s), Start: N - fast rt','fontsize',10, 'fontweight', 'bold')
ylabel('Time (s), Start: N - slow rt','fontsize',10, 'fontweight', 'bold')
set(gca,'YDir','normal')


hold on
%plot([0:0.01:3],[0:0.01:3])
pl = line([.4 max(range)],[.4 max(range)], 'Color', 'k', 'LineStyle', '-', 'LineWidth', .5);

aaa=mean(Duu(:,li2)');
fi=ang(find(aaa==max(aaa)));
xx=3/tand(fi);
fi2=fi;


pl = line([.4 xx],[.4 max(range)], 'Color', 'k', 'LineStyle', '-.', 'LineWidth', .5);

xlim([0 3]);
clim([-0.02 0.035]);

hold off





ax1 = subplot(5, 3, 12);


fig = gcf;
FontSize = 10;
set(fig,'defaultAxesFontSize',FontSize);
options.handle = fig;
% options.color_area = [128 193 219]./255; % Blue theme
% options.color_line = [ 52 148 186]./255;

options.color_area = barColors1; % Blue theme
options.color_line = barColors1;

cmap = parula(20);
col1=cmap(3,:);

options.color_area = col1; % Blue theme
options.color_line = col1;

co1=col1;


cmap = parula(20);
col1=cmap(12,:);

co2=col1;



options.alpha      = 0.7;
options.line_width = 1;
options.error      = 'sem'; % 95 percent confidence interval


%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
lis=li1;
% Du=mean(Duu(:,lis),2);
% Dus=std(Duu(:,lis),[],2)/sqrt(15);
%errorbar(ang,Du,Dus)
plot_areaerrorbar(Duu(:,lis)',ang, options);


hold on;
options.alpha      = 0.7;


options.color_area = col1; % Blue theme
options.color_line = col1;

%plot_areaerrorbar(DAAg(11:51,:)',[-2:0.1:2], options);
lis=li2;
% Du=mean(Duu(:,lis),2);
% Dus=std(Duu(:,lis),[],2)/sqrt(15);
%errorbar(ang,Du,Dus)
plot_areaerrorbar(Duu(:,lis)',ang, options);

hold on
%plot(led(:,11:51),zeros(41,1),'black')
pl = xline([0 fi1], 'Color', co1, 'LineStyle', '-.', 'LineWidth', 1);
pl = xline([0 fi2], 'Color', co2, 'LineStyle', '-.', 'LineWidth', 1);
pl = xline([0 45], 'Color', 'k', 'LineStyle', '-', 'LineWidth', .5);

box off
set(gca,'fontname','helvetica')  % Set it to times

title('Dynamic similarity by angle','fontsize',10)

%title('Along zero lag (N vs. N)','fontsize',10)

xlabel('Angle (degrees), slow/fast rt','fontsize',10, 'fontweight', 'bold')
ylabel('Dynamic Similarity','fontsize',10, 'fontweight', 'bold')
hLegend =legend('SPs','','nSPs','','','fontsize',10,'Location','northwest')

% title(hLegend,'Sequential Planning')
% leg.Title.Visible = 'on';

set(hLegend, 'Box', 'off');
xticks(0:100/4:100);
ylim([0 0.04]);
 xlim([15 75]);
set(gca, 'XTick', [15:10:75]);



box off
%text(85,0.022, '*', 'FontSize', 12, 'FontWeight', 'bold');


hold off



annotation('textbox', [0.03, 0.835, 0.1, 0.1], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.03, 0.67, 0.1, 0.1], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.03, 0.5, 0.1, 0.1], 'String', 'G', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.03, 0.34, 0.1, 0.1], 'String', 'J', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.03, 0.17, 0.1, 0.1], 'String', 'M', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

annotation('textbox', [0.315, 0.835, 0.1, 0.1], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.315, 0.67, 0.1, 0.1], 'String', 'E', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.315, 0.5, 0.1, 0.1], 'String', 'H', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.315, 0.34, 0.1, 0.1], 'String', 'K', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

annotation('textbox', [0.60, 0.835, 0.1, 0.1], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.6, 0.67, 0.1, 0.1], 'String', 'F', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.6, 0.5, 0.1, 0.1], 'String', 'I', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
annotation('textbox', [0.6, 0.34, 0.1, 0.1], 'String', 'L', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
%annotation('textbox', [0.315, 0.17, 0.1, 0.1], 'String', 'M', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

annotation('textbox', [.475, 0.14, 0.1, 0.1], 'String', 'SPs>nSPs, Day 1+Day 7, Whole Brain Cluster-Level FWE Corrected p<0.05', 'EdgeColor', 'none', 'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment', 'center','color','k');


%annotation('textbox', [0.04, 0.34, 0.1, 0.1], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

%annotation('textbox', [0.04, 0.85, 0.1, 0.1], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');




% Define custom position for the axes
customPosition = [0.16, 0, .7, 0.25]; % [left bottom width height]

% Create axes at custom position
ax1 = axes('Position', customPosition);

% Insert image into axes
filename = 'SPMhipp!.png'; 
thisImage = imread(filename);
imshow(thisImage, 'Parent', ax1); % Display image in the axes

drawnow;


%%
%print('figure_Cosyne11.png', '-dpng', '-r2000');
%% stats
% [H,P,CI,STATS] =ttest(squeeze(mean(DDp(4,:),1)),squeeze(mean(DDnp(4:31,:),1)),'tail','right')
% [H,P,CI,STATS] =ttest(squeeze(mean(DDp(5:31,:),1)),squeeze(mean(DDnp(5:31,:),1)),'tail','right')
% 
% [H,P,CI,STATS] =ttest(squeeze(mean(DBp(32:41,:),1)),squeeze(mean(DBnp(32:41,:),1)),'tail','right')
% 
% [H,P,CI,STATS] =ttest(squeeze(mean(RESo(li1,32:41),2)),0,'tail','right')
% [H,P,CI,STATS] =ttest(squeeze(mean(RESo(li2,32:41),2)),0,'tail','right')
% [H,P,CI,STATS] =ttest(squeeze(mean(RESo(li2,31:33),2)),0,'tail','right')
% [H,P,CI,STATS] =ttest(squeeze(mean(RESo(li2,31),2)),0,'tail','right')
% 
% [H,P,CI,STATS] =ttest(squeeze(mean(RESo(li1,32:41),2)),squeeze(mean(RESo(li2,32:41),2)),'tail','right')
% 
% 
% [H,P,CI,STATS] =ttest(maxSlope(li1),45,'tail','right')
% [H,P,CI,STATS] =ttest(maxSlope(li2),45,'tail','right')
% [H,P,CI,STATS] =ttest(maxSlope(li1),maxSlope(li2),'tail','right')


