%%
clear;clc;
setpath4 = ['D:\Project\paper4\3_afterICA\'];
setpath5 = ['D:\Project\paper4\5_fooofresult\'];
setpath6 = ['D:\Project\paper4\5_fooofresult\hc\'];
setpath7 = ['D:\Project\paper4\5_fooofresult\pdoff\'];
setpath8 = ['D:\Project\paper4\5_fooofresult\pdon\'];
%%
tic;
cd(setpath4);
file= dir([setpath4,'*.set']);
for i=1:length(file)
    EEG = pop_loadset([setpath4, filesep, file(i).name]);
    savePath = strcat(setpath5,'5_',file(i).name(3:end-4), '.mat');
    cleandata=double(EEG.data);
%save (savePath,'cleandata');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PSD estimation
psds=[];
fs=512;
N=1024;
nfft= 2^nextpow2(N);
noverlap=128;
window= hamming(256);
for j=1:EEG.nbchan
    [pxx,f]= pwelch(cleandata(j,:),window,noverlap,nfft,fs);
    psds=[psds,pxx];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FOOOF Parameter
freqs = f';
power_spectrum = psds';
%settings = struct();  
f_range = [2,40];
settings.peak_width_limits =[1 12];%(default:0.5-12)
settings.max_n_peak=inf;%（default:inf）
settings.min_peak_height=0;%（default:0）
settings.peak_threshold=1;%（default:2）
settings.aperiodic_mode='fixed';%（default:fixed）
settings.verbose=1;%（default:1）
settings;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Run FOOOF, also returning the model
fooof_results=([]);
for k=1:32
fooof_result  = fooof(freqs, power_spectrum(k,:), f_range, settings, 1);
fooof_results = [fooof_results,fooof_result];
end
%fooof_plot(fooof_results(15))
%fooof_plot(fooof_result,1);
save(savePath,'fooof_results');
end
cd(setpath5);
toc;
