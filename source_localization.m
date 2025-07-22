%load the data

in.timeBins     = 1;                % number of data bins to train and test on
in.mode         = 1;
in.decod        = 1; 
partList        = [1 2 3 4 5 6 9 10 11 12 14 15 18 19 20 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36];

clear MATS MATSS MATSS3 MATSS0 MATSS1 MATSS3a MMATS0 MMATS1 MMATS2 MMATS3 MMATS4 MMATS5


gaus=.000010;
ran=31;
time=5;



dataFolder      = ['D:\Project 1\ChainRL\Functional Localiser Data New\'];

for p           = 1:30 %length(partList)
    p

text='classic_100_all_b50';

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

MMATS0(:,:,:,p)=MATS0(:,1:ran,1:ran);
MMATS1(:,:,:,p)=MATS1(:,1:ran,1:ran);
MMATS2(:,:,:,p)=MATS2(:,1:ran,1:ran);
MMATS3(:,:,:,p)=MATS3(:,1:ran,1:ran);
MMATS4(:,:,:,p)=MATS4(:,1:ran,1:ran);


for k=1:ran;
      MATSS0(:,k,p)=MATS0(:,k,k);

end


text='classic_100_r1_b50';


ran=31;
time=5;


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


MMATS0_1(:,:,:,p)=MATS0(:,1:ran,1:ran);
MMATS1_1(:,:,:,p)=MATS1(:,1:ran,1:ran);
MMATS2_1(:,:,:,p)=MATS2(:,1:ran,1:ran);
MMATS3_1(:,:,:,p)=MATS3(:,1:ran,1:ran);
MMATS4_1(:,:,:,p)=MATS4(:,1:ran,1:ran);


for k=1:ran;
      MATSS0_1(:,k,p)=MATS0(:,k,k);

end


text='classic_100_r2_b50';





ran=31;
time=5;




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



MMATS0_2(:,:,:,p)=MATS0(:,1:ran,1:ran);
MMATS1_2(:,:,:,p)=MATS1(:,1:ran,1:ran);
MMATS2_2(:,:,:,p)=MATS2(:,1:ran,1:ran);
MMATS3_2(:,:,:,p)=MATS3(:,1:ran,1:ran);
MMATS4_2(:,:,:,p)=MATS4(:,1:ran,1:ran);

for k=1:ran;
      MATSS0_2(:,k,p)=MATS0(:,k,k);

end


 end


%%

load(['D:\Project 1\ChainRL\Subject ' num2str(partList(p)) '\cqdceffMpPart1_' num2str(11) '_SourceRecon3\BF.mat']);


ax=sources.grid.xgrid;
ay=sources.grid.ygrid;
az=sources.grid.zgrid;

allpos=round(sources.grid.allpos,3);

ax(2,:)=unique(allpos(:,1));
ay(2,:)=unique(allpos(:,2));
az(2,:)=unique(allpos(:,3));

ax(3,:)=(ax(1,:)/10)+7;
ay(3,:)=(ay(1,:)/10)+11;
az(3,:)=(az(1,:)/10)+8;

pos=zeros(size(allpos));

for i=1:size(allpos,1);
    for j=1:size(ax,2);
        if allpos(i,1)==ax(2,j);
            pos(i,1)=ax(3,j);
        end
    end

        for j=1:size(ay,2);
        if allpos(i,2)==ay(2,j);
            pos(i,2)=ay(3,j);
        end
        end

            for j=1:size(az,2);
        if allpos(i,3)==az(2,j);
            pos(i,3)=az(3,j);
        end
            end
end


MAT=zeros(size(ax,2),size(ay,2),size(az,2));

inside=sources.grid.inside;
inside_pos=pos(inside,:);

%% participanst wise files with voxel values

MMM=MMATS1; %this would be for all data
%MMM=MMATS1_2-MMATS1_1; %this would be for day 7 minus 1


DI=zeros(size(MMM,1),61,size(MMM,4));
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


DI(k,:,p)=DAA;

    end
end

DII=squeeze(mean(DI(:,32:41,:),2)); %we are doinf lags .1-1s

newDims = [91, 109, 91];
info1 = niftiinfo('uv_pow_cqdceffMpPart1_11.nii');

for j=1:30;
        clear Mat
for i=1:size(inside,1);
    Mat(inside_pos(i,1),inside_pos(i,2),inside_pos(i,3))=DII(i,j);
end
    ref=zeros(19,23,19);
    ref(4:17,4:21,1:16)=Mat.*Mat1;
    B = imresize3((ref), newDims);

niftiwrite(single(B),['participant_' num2str(j) '.nii'],info1);
end

%these files can now be manually put into a second level analysis in SPM to
%do full volume corretion and stats. enjoy!
