function Remove = movement(run,downSample,inFolder,outStub) 

if downSample
    D          	= spm_eeg_load([inFolder 'dp' outStub int2str(run)]);
else
    D          	= spm_eeg_load([inFolder 'p' outStub int2str(run)]);
end
load([inFolder outStub int2str(run) '_ICs.mat'],'ICs');
ICs=ICs;
eyeChan     = strmatch('UADC001',D.chanlabels);

R_PVal = 0.01;
Perms = 100; 

        D               = spm_eeg_load([inFolder 'p' outStub int2str(run)]);
        
Signal=D(eyeChan,:,1);
Comps=ICs.trial{1};      


channels=zeros(273,1);
for i=1:273;
    x=corrcoef(ICs.trial{1}(i,:),D(eyeChan,:,1));
    channels(i)=x(1,2);
end

        %% Do Correlations:
        
        Samples = size(Signal, 2);
        
        if (rem(Samples, 2) == 0) %%% Needs to be an uneven size for ff
            
            Comps = Comps(:, (1:(Samples - 1)));
            
            Signal = Signal(:, (1:(size(Signal, 2) - 1)));
            
            Samples = Samples - 1;
            
        end
        
        R = NaN(size(Comps, 1), size(Signal, 1));
        
        Remove = [];
        
        for i_Signal = 1:size(Signal, 1)
            
            R(:, i_Signal) = corr(Comps', Signal(i_Signal, :)');
            
            Z = zscore(R(:, i_Signal));
            
            %             Z = atanh(R(:, i_Signal));
            
            %%% Permute (Adapted from 'detect_ICA_artefacts.m' @ https://github.com/MRC-CBU/riksneurotools/blob/master/MEEG/detect_ICA_artefacts.m)
            
            F = fft(Signal(i_Signal, :), Samples);
            
            Phase = angle(F);
            
            Mag = abs(F);
            
            F_Time = floor((size(F, 2) - 1) / 2);
            
            Rand = Mag;
            
            for i_Perm = 1:Perms
                
                Rand(1, (2:(F_Time + 1))) = Mag(1, (2:(F_Time + 1))) .* exp((0 + 1i) * Phase(randperm(F_Time)));
                
                Rand(1, ((F_Time + 2):size(F, 2))) = conj(Rand(1, ((F_Time + 1):-1:2)));
                
                B = ifft(Rand, Samples);
                
                R_P = corr(Comps', B');
                
                clear B;
                
                Thres = prctile(abs(zscore(R_P)), (100 * (1 - R_PVal)));
                
%                 Thres = prctile(abs(atanh(R_P)), (100 * (1 - R_PVal)));
                
                clear R_P;
                
                Remove = cat(1, Remove, find(abs(Z) > Thres));
                
                Remove = unique(Remove);
                
                clear Thres;
                
            end
            
            %%%
            
            clear Z;
            clear Ff Mf Wf Hf Rf
            
        end

end