folder_path = '/home/ruairi/repos/signal_processing';
addpath(genpath(folder_path));
%%

fs = 1000;
t = 0:1/fs:5;
n = length(t);

sig = noisey_sig(n);

%%

mean_filtered = mean_filter_td(sig, 41);
gaus_filtered = gaussian_filter_td(sig, fs, 100, 20);

%%


figure(1), clf
subplot(311)
plot(t, sig)
title('original')

subplot(312)
plot(t, mean_filtered)
title('mean filtered')

subplot(313)
plot(t, gaus_filtered)
title('gaussian filtered')

