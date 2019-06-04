% load data
clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')
%%

chan_name = 'o1';

ntrials = EEG.trials;
nsamples_per_trial = EEG.pnts;
nfft = ntrials * nsamples_per_trial;

data_cat = reshape(EEG.data(get_chan_ind(chan_name, EEG), :, :), 1, nfft);

%% wavelets

num_f = 28;
min_f = 2;
max_f = 50;
wt = -2:1/EEG.srate:2;

[tf, f] = wavelet_fun(data_cat, min_f, max_f, num_f, wt);

%%
tf = reshape(tf, num_f, nsamples_per_trial, ntrials);
pow = 2 * abs(tf) .^ 2;
trial_averaged = mean(pow, 3);

%%
base_times = [-600, 0];
normed = db_normalise_fun(trial_averaged, EEG.times, base_times);

%%
figure(1), clf
subplot(211)
contourf(EEG.times, f, trial_averaged, 40, 'linecolor','none')
colorbar

subplot(212)
contourf(EEG.times, f, normed, 40, 'linecolor','none')
colorbar
set(gca, 'clim', [-3, 3])