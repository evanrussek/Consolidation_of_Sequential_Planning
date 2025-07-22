function D = preprocessMEG2_parallel(run,downSample,inFolder,inStub,outStub)
    

% Convert the data to SPM format
    if run < 10
        S.dataset   = [inFolder inStub '0' int2str(run) '.ds\' inStub '0' int2str(run) '.meg4'];
    else
        S.dataset   = [inFolder inStub int2str(run) '.ds\' inStub int2str(run) '.meg4'];
    end
    S.outfile       = [inFolder outStub int2str(run)];
    D               = spm_eeg_convert(S); clear S
    
end