% DEFINE SOME BASIC PARAMETERS CALCULATING CORRELATION PLOTS

in.dSamp        = 10;                % down-sample frequency (Hz)
in.timeWin      = [0 3];             % training and test time window (post-onset, s)
in.testWin      = [0 3];             % training and test time window (post-onset, s)
in.stimToTrain  = 9;                 % number of stimuli to train
in.blocks       = 50;                % cross-validation partitions
in.stimWin      = [-2 5];            % data range
in.mode         = 1;                 % irrelevant parameter for current script
in.decod        = 1;                 % irrelevant parameter for current script
in.dep          = 1;                 % irrelevant parameter for current script
in.timeBins     = 1;                 % irrelevant parameter for current script

for p           = 1:30;%1:30;
    [~]       	= functionalLocaliserLambdaCV_v20_source_rew(in,p);
end

clear p
delete(gcp('nocreate'));
