%%
clear;clc;close all
setpath5 = ['D:\Project\paper4\5_fooofresult\'];
setpath6 = ['D:\Project\paper4\5_fooofresult\hc\'];savepath6=['D:\Project\paper4\6_result\hc\'];
setpath7 = ['D:\Project\paper4\5_fooofresult\pdoff\'];savepath7=['D:\Project\paper4\6_result\pdoff\'];
setpath8 = ['D:\Project\paper4\5_fooofresult\pdon\'];savepath8=['D:\Project\paper4\6_result\pdon\'];
cd(setpath5);
%%
cd(setpath5);
for i=1:32
fooof_plot(fooof_results(i),0)
end
%% Overall browsing data
cd(setpath5);
resultfile= dir([setpath5,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];
for m=1:length(resultfile)
load(file_name{m});
    error = cat(1,fooof_results.error); errors = [errors,error];
    r_squared = cat(1,fooof_results.r_squared); r_squareds = [r_squareds,r_squared];
    aperiodic_param = cat(1,fooof_results.aperiodic_params);
    offset = aperiodic_param(:,1); offsets = [offsets,offset];
    exponent = aperiodic_param(:,2); exponents =[exponents,exponent];
    peak_param = cat(1,fooof_results.peak_params);gaussian_param= cat(1,fooof_results.gaussian_params);%由于每个通道的峰值参数和高斯参数维度不一致，故不能组建矩阵
    power_spectrum = cat(1,fooof_results.power_spectrum);power_spectrums = cat(3,power_spectrums,power_spectrum);
    fooofed_spectrum = cat(1,fooof_results.fooofed_spectrum);fooofed_spectrums = cat(3,fooofed_spectrums,fooofed_spectrum);
    ap_fit = cat(1,fooof_results.ap_fit);ap_fits = cat(3,ap_fits,ap_fit);
    clear error  r_squared  aperiodic_param offset exponent  peak_param gaussian_param power_spectrum  fooofed_spectrum ap_fit 
end
%% hc
cd(setpath6);
resultfile= dir([setpath6,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];
for m=1:length(resultfile)
load(file_name{m});
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
%% pd off
cd(setpath7);
resultfile= dir([setpath7,'*.mat']);
file_name =natsort({resultfile.name}, '[-+]?(NaN|Inf|\d+\.?\d*)');
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];
for m=1:length(resultfile)
load(file_name{m});
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
errors=[];r_squareds=[];offsets=[];exponents=[];power_spectrums=[];fooofed_spectrums=[];ap_fits=[];
for m=1:length(resultfile)
load(file_name{m});
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
%% Channel average
mean_r_squared = mean(r_squareds,1)';
mean_errors = mean(errors,1)';
mean_offsets = mean(offsets,1)';
mean_exponents = mean(exponents,1)';

%% Channel average
a=db2pow(ap_fits);%Return linear scale
b = mean(a,1);
c=squeeze(b);
mean_ap_fits=log10(c);%Return logarithmic scale
%figure;plot(freqs,c);
%figure;plot(log10(freqs),mean_ap_fits);

x=db2pow(fooofed_spectrums);
y = mean(x,1);
z=squeeze(y);
mean_fooofed_spectrums=log10(z);
%figure;plot(freqs,(z));

m=db2pow(power_spectrums);
n = mean(m,1);
o=squeeze(n);
mean_power_spectrums=log10(o);
%figure;plot(freqs,(o));

w = z-c;
mean_fooofflatten_spectrum= log10(w);
%figure;plot((freqs),(mean_fooofflatten_spectrum));
%figure;plot((freqs),w);

u = o-c;
mean_powerflatten_spectrum= log10(u);
%figure;plot((freqs),(mean_powerflatten_spectrum));
%figure;plot((freqs),u);

%% Subject average
mean_r_squared = mean(r_squareds,2);
mean_errors = mean(errors,2);
mean_exponents = mean(exponents,2);
mean_offsets = mean(offsets,2)
%% figure test
figure; topoplot(a,EEGchanlocs,'shading','interp','numcontour',5,'style','both','electrodes','on','chaninfo',EEGchaninfo,'drawaxis','off');...
    title('hcvson_offsets');

[h grid_or_val plotrad_or_grid, xmesh, ymesh]=topoplot(a,EEGchanlocs,'shading','interp','numcontour',5,'style','both','electrodes','on','chaninfo',EEGchaninfo,'drawaxis','off');...
    title('offsets');

%% figure test
figure; topoplot(b,EEGchanlocs,'style','fill','electrodes','on','chaninfo',EEGchaninfo,'drawaxis','off');...
    title('hcvsoff_offsets')

figure; topoplot(c,EEGchanlocs,'style','fill','electrodes','on','chaninfo',EEGchaninfo,'drawaxis','off');...
    title('offvson_offsets')
