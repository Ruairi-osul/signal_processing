folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')
%%

fs = EEG.srate;
t = EEG.times;
chan = 2;
n = EEG.pnts;
data = EEG.data(chan, :, :);
data = mean(data, 3);

wt = -2:1/fs:2;
cycles = 7;
f = 8;
wavelet = create_wavelet(wt, cycles, 8);

res = wavelet_convolve(wavelet, data);

figure(1), clf
subplot(211)
plot(t, data)

subplot(212)
plot(t, real(res))

%%
min_f = 2;
max_f = 30;
num_f = 20;
[wavelets, f] = wavelet_range(min_f, max_f, num_f, wt);
tf = zeros(num_f, n);
for i = 1:num_f
    coefs = wavelet_convolve(wavelets(i,:), data);
    tf(i, :) = abs(coefs);
end
contourf(1:n, f, tf, 'linecolor', 'none')

