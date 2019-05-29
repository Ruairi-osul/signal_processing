folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')
%%

%% single trial
% data
chan_name = 'pz';
data = EEG.data(get_chan_ind(chan_name, EEG), :, 1);

% wavelets
num_f = 5;
min_f = 2;
max_f = 30;
wt = -2:1/EEG.srate:2;

[tf, f] = wavelet_fun(data, min_f,max_f, num_f, wt);

%%

%contourf(1:EEG.pnts, f, abs(tf), num_f, 'linecolor', 'none')

%% many trials
chan_name = 'pz';
data = EEG.data(get_chan_ind(chan_name, EEG), :, :);

n_trials = EEG.trials;
n_points = EEG.pnts;
nflat = n_trials * n_points;

data_cat = reshape(data, 1, nflat);

% wavelets

num_f = 5;
min_f = 2;
max_f = 30;
wt = -2:1/EEG.srate:2;

%
[tf, f] = wavelet_fun(data_cat, min_f,max_f, num_f, wt);

% reshape
tf = reshape(tf, length(f), EEG.pnts, EEG.trials);

trial_averaged = mean(tf, 3);
phase_coupling = itpc(tf);
%%
contourf(EEG.times, f, phase_coupling)

