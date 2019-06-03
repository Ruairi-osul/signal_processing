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

%% multitaper

window = 0.3; % in s
interval = 200;

num_tapers = 3;
[tf, hz, timepoints] = multitaper(sig, num_tapers, t, fs, window, interval);

%%
base_timepoints = [-500, 0];
tf_norm = db_normalise_fun(tf, t, base_timepoints);

%%
figure(1), clf 
contourf(timepoints, hz, tf_norm, 60, 'linecolor','none')
set(gca,'clim',[-7 7])
ylim([0, 50])
xlabel('time [ms]')
ylabel('Frequency [hz]')
cbar = colorbar;
title(cbar, 'Power [db]')