folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%% 
% data
chan_ind = 43;
trial_ind = 4;
data = EEG.data(chan_ind, :, trial_ind);
t = EEG.times;

fs = EEG.srate/2;
low = 4;
high = 8;
filtered = bandpass2(data, fs, low, high);

%% plot

figure(1), clf 
subplot(211)
plot(t, data)
title('original')

subplot(212)
plot(t, filtered)
title('filtered between 4 and 8 Hz')

%% filter hilbert

a_sig = hilbert(filtered);
angs = angle(a_sig);

%% plot

figure(2), clf
subplot(311)
plot(t, data)
title('original')

subplot(312)
plot(t, filtered)
title('filtered signal between 4 and 8 Hz')

subplot(313)
plot(t, angs)
title('Angle of oscilation between 4 and 8 Hz')

%% tranition zones

t_zones = [0.1, 0.2, 0.4, 0.6];

filtered = zeros(length(t_zones), length(data));
forder = 3;

for i = 1:length(t_zones)
    filtered(i, :) = bandpass2(data, fs, low, high, forder, t_zones(i));
end

%%
figure(3), clf
plot(t, data), hold on
for i = 1:length(t_zones)
    plot(t, filtered(i, :)), hold on
end
legend([{'original'}, sprintfc('%d',t_zones)])
hold off