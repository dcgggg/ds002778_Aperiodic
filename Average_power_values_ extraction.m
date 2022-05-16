%%
clear;clc;close all
setpath5 = ['D:\Project\paper4\5_fooofresult\'];
setpath6 = ['D:\Project\paper4\5_fooofresult\hc\'];savepath6=['D:\Project\paper4\6_result\hc\'];
setpath7 = ['D:\Project\paper4\5_fooofresult\pdoff\'];savepath7=['D:\Project\paper4\6_result\pdoff\'];
setpath8 = ['D:\Project\paper4\5_fooofresult\pdon\'];savepath8=['D:\Project\paper4\6_result\pdon\'];
cd(setpath5);
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
    peak_param = cat(1,fooof_results.peak_params);gaussian_param= cat(1,fooof_results.gaussian_params);
    %Since the peak parameters and Gaussian parameters of each channel do not have the same dimension, the matrix cannot be formed
    power_spectrum = cat(1,fooof_results.power_spectrum);power_spectrums = cat(3,power_spectrums,power_spectrum);
    fooofed_spectrum = cat(1,fooof_results.fooofed_spectrum);fooofed_spectrums = cat(3,fooofed_spectrums,fooofed_spectrum);
    ap_fit = cat(1,fooof_results.ap_fit);ap_fits = cat(3,ap_fits,ap_fit);
    clear error  r_squared  aperiodic_param offset exponent  peak_param gaussian_param power_spectrum  fooofed_spectrum ap_fit 
end
%% Average for all channels
a=db2pow(ap_fits);%Return linear scale
b = mean(a,1);
c=squeeze(b);
mean_ap_fits=log10(c);%Return logarithmic scale
figure;plot(freqs,c);
figure;plot(log10(freqs),mean_ap_fits);

x=db2pow(fooofed_spectrums);
y = mean(x,1);
z=squeeze(y);
mean_fooofed_spectrums=log10(z);
figure;plot(freqs,(z));

m=db2pow(power_spectrums);
n = mean(m,1);
o=squeeze(n);
mean_power_spectrums=log10(o);
figure;plot(freqs,(o));

w = z-c;
mean_fooofflatten_spectrum= log10(w);
%figure;plot((freqs),(mean_fooofflatten_spectrum));
%test
figure;plot((freqs),w);

u = o-c;
mean_powerflatten_spectrum= log10(u);
%figure;plot((freqs),(mean_powerflatten_spectrum));
%test
figure;plot((freqs),u);

area=int(c,freqs,2,4)
%% power values extraction

raw_power=[];
for i= 1:46 
rawpower=o(:,i);
rp1=bandpower(rawpower, freqs,[13,35], 'psd');
raw_power=[raw_power;rp1];
end


fit_power=[];
for i= 1:46 
fitpower=z(:,i)
rp2=bandpower(fitpower, freqs,[13,35], 'psd');
fit_power=[fit_power;rp2];
end

fooofflatten_power=[];
for i= 1:46 
fooofflattenpower=w(:,i)
rp3=bandpower(fooofflattenpower, freqs,[13,35], 'psd');
fooofflatten_power=[fooofflatten_power;rp3];
end

powerflatten_power=[];
for i= 1:46 
powerflattenpower=u(:,i)
rp4=bandpower(powerflattenpower, freqs,[13,35], 'psd');
powerflatten_power=[powerflatten_power;rp4];
end

apfit=[];
for i= 1:46 
ap_fit=c(:,i)
rp5=bandpower(ap_fit, freqs,[13,35], 'psd');
apfit=[apfit;rp5];
end

clear rp1 rp2 rp3 rp4 rp5