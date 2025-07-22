function a = movement(run,downSample,inFolder,outStub)
%Remove

    %  Load the SPM data 
    D               = spm_eeg_load([inFolder 'p' outStub int2str(run)]);
    
    %  Convert to Fieldtrip format, in order to run ICA
    ftData          = spm2fieldtrip(D); clear D
    
    %  Run the ICA procedure (this will take a while, and require having EEGlab
    %  on your path)
    cfg.method      = 'runica';
    cfg.channel     = ftData.grad.label(strmatch('meggrad',ftData.grad.chantype));
    cfg.runica.maxsteps = 200;
    ICs             = ft_componentanalysis(cfg,ftData); clear cfg
    save([inFolder outStub int2str(run) '_ICs.mat'],'ICs'); clear ICs
    save([inFolder outStub int2str(run) '_ftData.mat'],'ftData','-v7.3'); clear ftData
    clc
    a=1;

end