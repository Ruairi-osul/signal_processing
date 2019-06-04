folder_path = 'C:\Users\Rory\extra_repos\signal_processing';
addpath(genpath(folder_path));
%%

n = 10000;
sig = brownian_noise(n)';

sig_drift = sig + linspace(-100, 100, n);

detrented = detrend(sig_drift);

%%
figure(1), clf
subplot(211)
plot(sig_drift)
title('original signal')

subplot(212)
plot(detrented)
title('detrended signal')