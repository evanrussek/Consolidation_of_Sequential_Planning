function a = movement(run,runn,downSample,inFolder,outStub,eyeCompts)

        
            % Load the SPM data file
            downSample
    if downSample
        D                   = spm_eeg_load([inFolder 'dp' outStub int2str(runn)]);
    else
        D                   = spm_eeg_load([inFolder 'p' outStub int2str(runn)]);
    end
    
    % Load the Fieldtrip data and ICA results
    load([inFolder outStub int2str(runn) '_ICs.mat'],'ICs');
    load([inFolder outStub int2str(runn) '_ftData.mat'],'ftData');
    cfg.component           = eyeCompts{run};
  %  [montage]             = ft_rejectcomponent(cfg,ICs,ftData); 
    [~,montage]             = ft_rejectcomponent(cfg,ICs,ftData); clear cfg ICs ftData

    clc
    
    %  Provide some additional information for the spm_eeg_montage function    
    sens                    = D.sensors('MEG');
    fullMontage.name       	= 'ICA';
    fullMontage.tra         = eye(length(sens.label));
    megSens                 = strmatch('meggrad',sens.chantype);
    fullMontage.tra(megSens,megSens) = montage.tra; clear megSens montage
    fullMontage.labelorg    = sens.label;
    fullMontage.labelnew    = sens.label;
    fullMontage.chantypeorg = sens.chantype;
    fullMontage.chanunitorg = sens.chanunit;
    fullMontage.chantypenew = sens.chantype;
    fullMontage.chanunitnew = sens.chanunit;
    S.montage               = fullMontage; clear fullMontage
    S.D                     = D;
    
    %  Use SPM to apply that montage to the original data
    [D, montage]            = spm_eeg_montage(S);
    clear montage S
    clc
 

%%  Then filter the data to remove line noise and low frequency drift

    if downSample
        D                   = spm_eeg_load([inFolder 'Mdp' outStub int2str(runn)]);
    else
        D                   = spm_eeg_load([inFolder 'Mp' outStub int2str(runn)]);
    end
    
    S.band                  = 'stop';
    S.freq                  = [48 52]; % removes 50 Hz
    S.D                     = D;
    D                       = spm_eeg_filter(S); clear S
    
    S.band                  = 'high';
    S.freq                  = 0.1;
    S.D                     = D;
    D                       = spm_eeg_filter(S); clear S D
a=[];


delete([inFolder 'Mp' outStub int2str(runn) '.mat']);
delete([inFolder 'Mp' outStub int2str(runn) '.dat']);
delete([inFolder 'fMp' outStub int2str(runn) '.mat']);
delete([inFolder 'fMp' outStub int2str(runn) '.dat']);

end