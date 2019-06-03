% load data
clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%% data

fs = EEG.srate;
chan = 27;
t = EEG.times;
sig = EEG.data(chan, :, 2);

%% sfft

window = 0.3; % in s
interval = 200;
[tf2, hz, timepoints] = manual_srfft_fun(sig, t, fs, window, interval);

%% normalise
base_timepoints = [-500, 0];
tf_norm = db_normalise_fun(tf2, t, base_timepoints);

%% plot

figure(1), clf 
contourf(timepoints, hz, tf_norm, 60, 'linecolor','none')
set(gca,'clim',[-7 7])
ylim([0, 50])
