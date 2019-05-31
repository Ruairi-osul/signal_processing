folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%% Wavelet convolution:
% data
chan_name = 'pz';
data = EEG.data(get_chan_ind(chan_name, EEG), :, 1);
low = 4;
high = 10;

% wavelets
filtered = bandpass2(data, EEG.srate, low, high);

figure(1), clf
subplot(211)
plot(EEG.times, data)
xlabel
subplot(212)
plot(EEG.times, filtered)