%% 
clear;clc;
setpath0 = ['D:\Project\paper4\0_raw_eeg\'];
setpath1 = ['D:\Project\paper4\1_filter\'];
setpath2 = ['D:\Project\paper4\2_ASR_reference\'];
setpath3 = ['D:\Project\paper4\3_afterICA\'];
%% Step1:channel location ; remove EMG channel ;  filter;  
tic;
cd(setpath0);
rawfile  = dir([setpath0, filesep, '*.bdf']);
parfor i=1:length(rawfile)
    
filepath1 = strcat(setpath0,rawfile(i).name);
setname1  = ['1_',rawfile(i).name];
     EEG = pop_biosig(filepath1);
     EEG = eeg_checkset( EEG );
     EEG=pop_chanedit(EEG, 'lookup','F:\\Matlabtoolbox\\eeglab2021.0\\plugins\\dipfit\\standard_BEM\\elec\\standard_1005.elc','rplurchanloc',1,'rplurchanloc',0);
     EEG = pop_select( EEG, 'nochannel',{'EXG1','EXG2','EXG3','EXG4','EXG5','EXG6','EXG7','EXG8'});
     EEG = pop_firws(EEG, 'fcutoff', [2 50], 'ftype', 'bandpass', 'wtype', 'hamming', 'forder', 1690, 'minphase', 0, 'usefftfilt', 0, 'plotfresp', 0, 'causal', 0);
     EEG = pop_saveset( EEG, 'filename',setname1,'filepath',setpath1);
     EEG = eeg_checkset( EEG );
     
Dis=strcat('QAQ当前进度 ',int2str(i/length(rawfile)*100),'%QAQ');
disp(Dis)
end
cd(setpath1);
toc;
%% Step2:auto reject artifacts；
tic;
file  = dir([setpath1, filesep, '*.set']);
parfor j=1:length(file) 
     setname2  = ['2_',file(j).name(3:end)];
     EEG = pop_loadset([setpath1, filesep, file(j).name]);
     EEG = pop_clean_rawdata(EEG, 'FlatlineCriterion','off','ChannelCriterion','off','LineNoiseCriterion','off','Highpass','off','BurstCriterion',20,'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian','WindowCriterionTolerances',[-Inf 7] );
     EEG = pop_saveset( EEG, 'filename',setname2,'filepath',setpath2);
end
cd(setpath2);
toc;
%% manual interpolate channel;  re-reference;
figure; pop_spectopo(EEG, 1, [0      882158.0612], 'EEG' , 'percent', 50, 'freqrange',[2 50],'electrodes','off');
%% check data
     EEG = pop_reref( EEG, []);
     EEG = pop_saveset( EEG, 'savemode','resave');
   
%% Step3:run ICA
tic;
filee  = dir([setpath2, filesep, '*.set']);
parfor k=1:length(filee) 
     setname3 = ['3_',filee(k).name(3:end)];
     EEG = pop_loadset([setpath2, filesep, filee(k).name]);
     EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'pca',32,'interrupt','on');
     EEG = pop_saveset( EEG, 'filename',setname3,'filepath',setpath3);
Dis=strcat('QAQ当前进度 ',int2str(k/length(filee)*100),'%QAQ');
disp(Dis)
end
cd(setpath3);
toc;
%% Visual screening of components After ICA
     EEG = pop_iclabel(EEG, 'default');%auto label
     EEG = pop_icflag(EEG, [NaN NaN;0.2 1;0.2 1;0.2 1;0.2 1;0.2 1;NaN NaN]);
     EEG = eeg_checkset( EEG );
    % pop_selectcomps(EEG, [1:32] );