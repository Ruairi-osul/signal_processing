clear all
folder_path = '/home/ruairi/repos/signal_processing/matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%%

fs = EEG.srate;
t = EEG.times;

frex = logspace(log10(10), log10(fs/5), 20);

timewin = 300; % in ms
timewin = round(timewin / (fs * 1000)) % in samples

window_centres = -300:25:800;
times_idx = dsearchn(t', window_centres');

basetime = [-300, -100];
base_idx = dsearchn(window_centres', basetime');

hz = linspace(0, fs/2, (timewin / 2) + 1);

hanwin = 0.5 - (0.5 * cos(2*pi.*linspace(0, 1, timewin)))';

tf = zeros(length(frex), length(window_centres));

chan = 5;
data = EEG.data(chan, :, :);

for i = 1:length(window_centres)
    time_inds = [window_centres(i) - floor(timewin / 2) + 1, ...
                 window_centres(i) + ceil(timewin / 2)];
    data_sub = squeeze(data(:, time_inds(1):time_inds(2), :));
    data_sub = baxfun(@times, data_sub, hanwin);

    data_subX = fft(data_sub) ./ timewin;
    mean_pow = mean(abs(data_sub).^2), 2);
end