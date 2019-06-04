% load data
clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')


%% bandpass filtered

% real eeg data
fs = EEG.srate;
chan = 27;
t = EEG.times;
sig = EEG.data(chan, :, 2);

low = 30;
high = 80;
filtered_sig = bandpass2(sig, fs, low, high);

inst_f = instantaneous_frequency(filtered_sig, fs);

inst_f_filtered = medfilt1(inst_f, 40);

%%

figure(1), clf
subplot(211)
plot(t(2:end), inst_f)
title('Instantaneous frequency')

subplot(212)
plot(t(2:end), inst_f_filtered)
title('With Median filter')