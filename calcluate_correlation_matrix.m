function[out] = calculate_correlation_matrix(in,p)


stimWin=in.stimWin;
partList        = [1 2 3 4 5 6 9 10 11 12 14 15 18 19 20 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36];
dataFolder      = ['D:\Project 1\ChainRL\Subject ', num2str(partList(p)), '\'];
saveFolder     	= 'D:\Project 1\ChainRL\Functional Localiser Data New';
saveFolder2     	= 'C:\Project 1\ChainRL\Functional Localiser Data New';
files=[11    11    12    11    11    11     0     0    11    11    11    11     0    11    11     0     0    11    11    11    11    11    11    11     0    11    12    16    11    11    11    11    11    11    11    11];
dataFiles    = ['cqdceffMpPart' num2str(1) '_' num2str(files(partList(p)))];

%load matrix for conversion to voxelspace
load(['D:\Project 1\ChainRL\Subject ' num2str(partList(p)) '\cqdceffMpPart1_' num2str(filess(partList(p),2)) '_SourceRecon3\BF.mat']);
bfW = vertcat(inverse.MEG.W{:});

%good channels
chansIn = strcmp('MEGGRAD',data.D.chantype);
chansIn(data.D.badchannels) = false;
chansIn = find(chansIn);

%% Assign some memory
if length(in.timeWin) == 1
    nSamps      = 1;
    out.timeBase    = nan(1,nSamps);
elseif length(in.timeWin) == 2
    nSamps      = round(diff(in.timeWin)*in.dSamp)+1;
    out.timeBase    = nan(1,nSamps);
else
    error('Time window must be vector with one entry or one start and end time');
end

% Update the user
disp(['Analysing participant ' int2str(p) ' of ' int2str(length(dataFiles))]); drawnow

% Load the data, identify the MEG channels and time window of interest
%D               = spm_eeg_load([dataFolder filesep 'Participant ' int2str(partList(p)) filesep dataFiles{p}]);
D               = spm_eeg_load([dataFolder dataFiles]);
S.D             = D;
S.fsample_new   = in.dSamp;
D               = spm_eeg_downsample(S); clear S
timeWin=in.stimWin;
megChans        = strmatch('MEGGRAD',D.chantype);


oldTime=[0:1/in.dSamp:7];
newTime=[0:1/in.dSamp:7]-2;

stimulus=[];
conds=D.conditions;

 %behav data
 data=load('TUTTI_data');
 DD=data.D;
 DD.ID(1:405)=36;
 outs = DD(DD.ID==partList(p),:);
 rew=(outs.state_number);
 NEW=(outs.depth_new);

 %name for file
 textt='100_all_b50';

 %set conditions (both runs, trials with responses, all depths)
 out1=outs(outs.run==0,:);
 N1=out1.run>=0;
 N2=out1.block_number>=10;
 N3=out1.trial_accept>=0;
 N4=out1.NEW>0;
 NEW1=N1.*N2.*N3.*N4;

 out2=outs(outs.run==1,:);
 N1=out2.run==1;
 N2=out2.block_number>=10;
 N3=out2.trial_accept>=0;
 N4=out2.NEW>0;
 NEW2=N1.*N2.*N3.*N4;

 new=NEW1;
 new(size(NEW1,1)+1:(size(NEW1,1)+size(NEW2,1)))=NEW2;

%extract trial order of start states
[stimulus,stimulus2a,stimulus2b,stimulus2c,stimulus2d,stimulus2e,stimulus2f,stimulus2g,stimulus2h,stimulus2x]  = trial_order(out1,out2,new);

%bad trials
remov=[];
keep=find(stimulus>-5);
stimulus(remov)=[];
stimulust=stimulus;
stimuli         = unique(stimulus)';
badTrials       = zeros(size(stimulus));
badTrials(D.badtrials)  = 1;

%randomize which trials go in each half for each of the N(in.blocks) half
%splits. this procedure controls for day 1 vs 7.

if size(stimulus,2)==486;
block=zeros(in.blocks,486);
    for g=1:in.blocks
for jj=1:9;
bl=find(stimulus(1,1:243)==jj);
blo=ceil((1:size(bl,2))./(size(bl,2)/2));
ra=randperm(size(bl,2));
blo=blo(ra);

for nn=1:size(bl,2);
    block(g,bl(nn))=blo(nn);
end
%
bl=find(stimulus(1,244:486)==jj)+243;
blo=ceil((1:size(bl,2))./(size(bl,2)/2));
ra=randperm(size(bl,2));
blo=blo(ra);
for nn=1:size(bl,2);
    block(g,bl(nn))=blo(nn);
end

end

    end

elseif size(stimulus,2)==405 %custom for the participants with missed runs

    block=zeros(in.blocks,405);

        for g=1:in.blocks
for jj=1:9;
%
bl=find(stimulus(1,1:243)==jj);
blo=ceil((1:size(bl,2))./(size(bl,2)/2));
ra=randperm(size(bl,2));
blo=blo(ra);
for nn=1:size(bl,2);
    block(g,bl(nn))=blo(nn);
end
%
bl=find(stimulus(1,244:405)==jj)+243;
%blo=ceil((1:size(bl,2))./(size(bl,2)/in.blocks));
blo=ceil((1:size(bl,2))./(size(bl,2)/2));
ra=randperm(size(bl,2));
blo=blo(ra);
for nn=1:size(bl,2);
    block(g,bl(nn))=blo(nn);
end

end

end

end


%meg data
chans=strmatch('MEGGRAD',D.chantype);
megData=D(chans,:,keep);

clear t megChans D oldTime timeWin

% Identify the time window of interest in the downsampled data
if length(in.timeWin)==2
    timeWin             = find(newTime>=(in.timeWin(1)),1,'first') : find(newTime<=(in.timeWin(2)),1,'last');
else
    [~,timeWin]         = min(abs(newTime-in.timeWin(1)));
end
out.timeBase            = newTime(timeWin);

nummy=size(timeWin,2);

% Identify the time window of interest in the downsampled data
if length(in.testWin)==2
    testWin             = find(newTime>=(in.testWin(1)),1,'first') : find(newTime<=(in.testWin(2)),1,'last');
else
    [~,testWin]         = min(abs(newTime-in.testWin(1)));
end
%out.timeBase            = newTime(timeWin);


clear newTime

dep=in.dep;
if dep==-1;
si=size(new);
new=ones(si);
end
% 


%transform to voxelspace
 Data=megData(chansIn',:,:);
 for z=1:size(Data,3);
 Datas = bfW * Data(:,:,z);
 DATA(:,:,z)=Datas(:,:);
 end


 megDatas=DATA; clear DATA Data Datas;


 %these are the output variables
            outo.accuracy1s=zeros(1950,nummy,nummy);
            outo.accuracy2s=zeros(1950,nummy,nummy);
            outo.accuracy3s=zeros(1950,nummy,nummy);
            outo.accuracy4s=zeros(1950,nummy,nummy);            
            outo.accuracy5s=zeros(1950,nummy,nummy);

nn1=0;
nn2=0;
nn3=0;
nn4=0;
nn5=0;

% Then, cycle through each partition...
for b           = 1 : in.blocks

    %block=ones(size(block));
    for bs=1:2;
    
    % Extract the null data, if required (same for every time window)

    

    for tc               = 1 : 9;

        % Extract the data in half 1 for start state N

        trainData       = megDatas(:, timeWin(1)-floor(in.timeBins/2):timeWin(length(timeWin))+floor(in.timeBins/2), block(b,:)~=bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        trainData       = zscore(trainData,[],3);
        trainCond       = stimulus2x(block(b,:)~=bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        trainData       = trainData(:,:,trainCond'==tc);

        % Extract the test data

  for tt               = 1 : length(testWin)

        % Extract the data in half 2 for start state N

        testData        = megDatas(:, testWin(tt)-floor(in.timeBins/2):testWin(tt)+floor(in.timeBins/2), block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData        = zscore(reshape(testData,[size(testData,1)*size(testData,2) size(testData,3)]),[],2);
        testCond        = stimulus2x(block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData       =  testData(:,testCond'==tc);

         % Extract the data in half 2 for start state N-1


        testData1        = megDatas(:, testWin(tt)-floor(in.timeBins/2):testWin(tt)+floor(in.timeBins/2), block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData1        = zscore(reshape(testData1,[size(testData1,1)*size(testData1,2) size(testData1,3)]),[],2);
        testCond1        = stimulus2a(block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData1       =  testData1(:,testCond1'==tc);

         % Extract the data in half 2 for start state N-2

        testData2        = megDatas(:, testWin(tt)-floor(in.timeBins/2):testWin(tt)+floor(in.timeBins/2), block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData2        = zscore(reshape(testData2,[size(testData2,1)*size(testData2,2) size(testData2,3)]),[],2);
        testCond2       =  stimulus2b(block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData2       =  testData2(:,testCond2'==tc);

         % Extract the data in half 2 for start state N-3

        testData3        = megDatas(:, testWin(tt)-floor(in.timeBins/2):testWin(tt)+floor(in.timeBins/2), block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData3        = zscore(reshape(testData3,[size(testData3,1)*size(testData3,2) size(testData3,3)]),[],2);
        testCond3       =  stimulus2c(block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData3       =  testData3(:,testCond3'==tc);

         % Extract the data in half 2 for start state N-4

        testData4        = megDatas(:, testWin(tt)-floor(in.timeBins/2):testWin(tt)+floor(in.timeBins/2), block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData4        = zscore(reshape(testData4,[size(testData4,1)*size(testData4,2) size(testData4,3)]),[],2);
        testCond4        = stimulus2d(block(b,:)==bs & ismember(stimulus,stimuli) & badTrials==0 & new'==dep);
        testData4       =  testData4(:,testCond4'==tc);

%score over voxels
train=zscore(mean(trainData,3),[],1);
test=zscore(mean(testData,2),[],1);
test1=zscore(mean(testData1,2),[],1);
test2=zscore(mean(testData2,2),[],1);
test3=zscore(mean(testData3,2),[],1);
test4=zscore(mean(testData4,2),[],1);


%here we pair multiply each voxelvalue (zscored) across the half-split.
%averaging this resultant vector (done in plotting script) will give the Pearson correlation coefficient

ff=train.*test;
if ~isnan(ff(1,1))
            outo.accuracy1s(:,:,tt)             = outo.accuracy1s(:,:,tt)+(train.*test); 
            nn1=nn1+1;
end

ff=train.*test1;
if ~isnan(ff(1,1))
            outo.accuracy2s(:,:,tt)             = outo.accuracy2s(:,:,tt)+(train.*test1); 
            nn2=nn2+1;
end

ff=train.*test2;
if ~isnan(ff(1,1))
             outo.accuracy3s(:,:,tt)             = outo.accuracy3s(:,:,tt)+(train.*test2); 
             nn3=nn3+1;
end

ff=train.*test3;
if ~isnan(ff(1,1))
             outo.accuracy4s(:,:,tt)             = outo.accuracy4s(:,:,tt)+(train.*test3); 
             nn4=nn4+1;
end

ff=train.*test4;
if ~isnan(ff(1,1))
             outo.accuracy5s(:,:,tt)             = outo.accuracy5s(:,:,tt)+(train.*test4); 
              nn5=nn5+1;
end



            end
        end
        
    end
end

%here just dividing over all the half splits and all stimuli 
             outo.accuracy1s=outo.accuracy1s./(nn1/tt); 
             outo.accuracy2s=outo.accuracy2s./(nn2/tt);
             outo.accuracy3s=outo.accuracy3s./(nn3/tt);
             outo.accuracy4s=outo.accuracy4s./(nn4/tt);
             outo.accuracy5s=outo.accuracy5s./(nn5/tt);

% Save the data
out.stimuli             = stimuli; 

bb=round(outo.accuracy1s,2);
save([saveFolder filesep 'part' int2str(partList(p)) '_funcLocLambda' int2str(partList(4)) 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins' '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING2s_classic_' textt int2str(in.decod) '.mat'],'in','bb');
bb=round(outo.accuracy2s,2);
save([saveFolder filesep 'part' int2str(partList(p)) '_funcLocLambda' int2str(partList(4)) 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins' '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING3s_classic_' textt int2str(in.decod) '.mat'],'in','bb');
bb=round(outo.accuracy3s,2);
save([saveFolder filesep 'part' int2str(partList(p)) '_funcLocLambda' int2str(partList(4)) 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins' '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING4s_classic_' textt int2str(in.decod) '.mat'],'in','bb');
bb=round(outo.accuracy4s,2);
save([saveFolder filesep 'part' int2str(partList(p)) '_funcLocLambda' int2str(partList(4)) 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins' '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING5s_classic_' textt int2str(in.decod) '.mat'],'in','bb');
bb=round(outo.accuracy5s,2);
save([saveFolder filesep 'part' int2str(partList(p)) '_funcLocLambda' int2str(partList(4)) 'CVDatas_OSLbadTrials_' int2str(in.timeBins) 'bins' '_mode' int2str(in.mode) '_TASK2_source_FULL_SOURCING6s_classic_' textt int2str(in.decod) '.mat'],'in','bb');


