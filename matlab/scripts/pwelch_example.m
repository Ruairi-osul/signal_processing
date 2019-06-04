%folder_path = 'C:\Users\Rory\extra_repos\signal_processing';
folder_path = '/home/ruairi/repos/signal_processing';

addpath(genpath(folder_path));
%%
clear 

load('EEGrestingState.mat')

%%

fs = srate;
coefs_static = rfft(eegdata);
hz_static = rfftfreq(length(eegdata), fs);
abs_static = abs(coefs_static).^2;

%%

[abs_welch, hz_welch] = pwelch(eegdata, [], [], [], fs);

%%
figure(1), clf
subplot(211)
plot(hz_static, abs_static)
xlim([0, 20])
title('Static FFT')

subplot(212)
plot(hz_welch, abs_welch)
xlim([0, 20])
title('Welch FFT')