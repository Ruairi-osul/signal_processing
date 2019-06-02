% load data
clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%%

fs = EEG.srate;
chan = 27;
t = EEG.times;

sig = EEG.data(chan, :, 2);

nfft = 300;                             % ms
nfft = round((nfft * fs) / 1000);       % in samples

%%
[tf, hz, fft_centres] = manual_srfft(sig, nfft, fs);

%%
tf_norm = db_normalise(tf, mean(tf(:, 1:3), 2));
%%
figure(1), clf 
contourf(fft_centres, hz, tf_norm, 40, 'linecolor','none')


%%

window = 0.3; % in s
interval = 200;
[tf2, hz, timepoints] = manual_srfft_fun(sig, t, fs, window, interval);
%%
base_timepoints = [-500, 0];
tf_norm = db_normalise_fun(tf2, t, base_timepoints);
%%
figure(1), clf 
contourf(timepoints, hz, tf_norm, 60, 'linecolor','none')
set(gca,'clim',[-7 7])

