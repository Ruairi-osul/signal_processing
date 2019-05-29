folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')
%%

%% Wavelet convolution:
% data
chan_name = 'pz';
data = EEG.data(get_chan_ind(chan_name, EEG), :, 1);

% wavelets
num_f = 5;
min_f = 2;
max_f = 30;
wt = -2:1/EEG.srate:2;
min_cycle = 4;
max_cycle = 10;

[tf, f] = wavelet_fun(data, min_f,max_f, num_f, wt);

contourf(1:EEG.pnts, f, abs(tf), num_f, 'linecolor', 'none')
