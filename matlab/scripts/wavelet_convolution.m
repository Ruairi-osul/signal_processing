folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%%

% data
t = EEG.times;
n = EEG.pnts;
fs = EEG.srate
chan = 2;
data = EEG.data(2, :, :);
erp = mean(data, 3);

% wavelet
wt = -2:1/fs:2;
min_f = 2;
max_f = 30;
num_f = 40;
[wavelets, f] = wavelet_range(min_f, max_f, num_f, wt);

tf = zeros(num_f, n);
for i = 1:num_f
    coefs = wavelet_convolve(wavelets(i, :), erp);
    tf(i, :) = abs(coefs);
end

figure(1), clf 
subplot(2,2,[1 2])
contourf(1:n, f, tf, 40, 'linecolor', 'none')
xlabel


% f = 6;
% cycles = 7;
% wavelet = create_wavelet(wt, cycles, f);

% res = wavelet_convolve(wavelet, erp);

% figure(1), clf



%%
[wavelets, f] = wavelet_range()
