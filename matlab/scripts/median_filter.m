folder_path = 'C:\Users\Rory\extra_repos\signal_processing';
addpath(genpath(folder_path));
%%

n = 1000;
sig = brownian_noise(n);

noise_sites = randperm(n);
frac_noise = 0.05;
noise_sites = noise_sites(1:round(frac_noise*n));
sig(noise_sites) =  50 + randn(size(noise_sites)) * 100;

%%
filtered = medfilt1(sig, 20);
%%

figure(1), clf
subplot(211)
plot(sig)
title('signal with spike noise')

subplot(212)
plot(filtered)
title('median filtered')