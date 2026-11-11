%% power values extraction of 32 channels
%% Extract data from the result file
clear;clc;close all
setpath5 = ['D:\Project\paper4\5_fooofresult\'];
setpath6 = ['D:\Project\paper4\5_fooofresult\hc\'];savepath6=['D:\Project\paper4\6_result\hc\'];
setpath7 = ['D:\Project\paper4\5_fooofresult\pdoff\'];savepath7=['D:\Project\paper4\6_result\pdoff\'];
setpath8 = ['D:\Project\paper4\5_fooofresult\pdon\'];savepath8=['D:\Project\paper4\6_result\pdon\'];
cd(setpath5);

%% hc
cd(setpath6);
resultfile= dir([setpath6,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];freqs = [];
for m=1:length(resultfile)
    data = load(fullfile(setpath6, file_name{m}), 'fooof_results');
    fooof_results = data.fooof_results;
    if isempty(freqs)
        freqs = get_freqs_from_fooof_results(fooof_results);
    end
    error = cat(1,fooof_results.error); errors = [errors,error];
    r_squared = cat(1,fooof_results.r_squared); r_squareds = [r_squareds,r_squared];
    aperiodic_param = cat(1,fooof_results.aperiodic_params);
    offset = aperiodic_param(:,1); offsets = [offsets,offset];
    exponent = aperiodic_param(:,2); exponents =[exponents,exponent];
    peak_param = cat(1,fooof_results.peak_params);gaussian_param= cat(1,fooof_results.gaussian_params);%由于每个通道的峰值参数和高斯参数维度不一致，故不能组建矩阵
    power_spectrum = cat(1,fooof_results.power_spectrum);power_spectrums = cat(3,power_spectrums,power_spectrum);
    fooofed_spectrum = cat(1,fooof_results.fooofed_spectrum);fooofed_spectrums = cat(3,fooofed_spectrums,fooofed_spectrum);
    ap_fit = cat(1,fooof_results.ap_fit);ap_fits = cat(3,ap_fits,ap_fit);
    clear error  r_squared  aperiodic_param offset exponent  peak_param  power_spectrum  fooofed_spectrum ap_fit
end

%%  pd off
cd(setpath7);
resultfile= dir([setpath7,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];freqs = [];
for m=1:length(resultfile)
    data = load(fullfile(setpath7, file_name{m}), 'fooof_results');
    fooof_results = data.fooof_results;
    if isempty(freqs)
        freqs = get_freqs_from_fooof_results(fooof_results);
    end
    error = cat(1,fooof_results.error); errors = [errors,error];
    r_squared = cat(1,fooof_results.r_squared); r_squareds = [r_squareds,r_squared];
    aperiodic_param = cat(1,fooof_results.aperiodic_params);
    offset = aperiodic_param(:,1); offsets = [offsets,offset];
    exponent = aperiodic_param(:,2); exponents =[exponents,exponent];
    peak_param = cat(1,fooof_results.peak_params);gaussian_param= cat(1,fooof_results.gaussian_params);%由于每个通道的峰值参数和高斯参数维度不一致，故不能组建矩阵
    power_spectrum = cat(1,fooof_results.power_spectrum);power_spectrums = cat(3,power_spectrums,power_spectrum);
    fooofed_spectrum = cat(1,fooof_results.fooofed_spectrum);fooofed_spectrums = cat(3,fooofed_spectrums,fooofed_spectrum);
    ap_fit = cat(1,fooof_results.ap_fit);ap_fits = cat(3,ap_fits,ap_fit);
    clear error  r_squared  aperiodic_param offset exponent  peak_param  power_spectrum  fooofed_spectrum ap_fit
end


%%  pd on
cd(setpath8);
resultfile= dir([setpath8,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];freqs = [];
for m=1:length(resultfile)
    data = load(fullfile(setpath8, file_name{m}), 'fooof_results');
    fooof_results = data.fooof_results;
    if isempty(freqs)
        freqs = get_freqs_from_fooof_results(fooof_results);
    end
    error = cat(1,fooof_results.error); errors = [errors,error];
    r_squared = cat(1,fooof_results.r_squared); r_squareds = [r_squareds,r_squared];
    aperiodic_param = cat(1,fooof_results.aperiodic_params);
    offset = aperiodic_param(:,1); offsets = [offsets,offset];
    exponent = aperiodic_param(:,2); exponents =[exponents,exponent];
    peak_param = cat(1,fooof_results.peak_params);gaussian_param= cat(1,fooof_results.gaussian_params);%由于每个通道的峰值参数和高斯参数维度不一致，故不能组建矩阵
    power_spectrum = cat(1,fooof_results.power_spectrum);power_spectrums = cat(3,power_spectrums,power_spectrum);
    fooofed_spectrum = cat(1,fooof_results.fooofed_spectrum);fooofed_spectrums = cat(3,fooofed_spectrums,fooofed_spectrum);
    ap_fit = cat(1,fooof_results.ap_fit);ap_fits = cat(3,ap_fits,ap_fit);
    clear error  r_squared  aperiodic_param offset exponent  peak_param  power_spectrum  fooofed_spectrum ap_fit
end

%%  32 channel power values were extracted in each person
a=db2pow(ap_fits);%Return linear scale
apfits=[];
freq_vector = freqs(:);
for i= 1:15
    apfit=[];
    for j=1:32
       aa=a(j,:,i);
       rp1=bandpower(aa(:), freq_vector,[4,8], 'psd');
       apfit=[apfit;rp1];
    end
       apfits=[apfits;apfit];

end

x=db2pow(fooofed_spectrums);%Return linear scale
fooofspectrum=[];
for i= 1:15
    fooofspectra=[];
    for j=1:32
       xx=x(j,:,i);
       rp2=bandpower(xx(:), freq_vector,[4,8], 'psd');
       fooofspectra=[fooofspectra;rp2];
    end
       fooofspectrum=[fooofspectrum;fooofspectra];

end

correctedspectrum=fooofspectrum-apfits;
