folder_path = '/home/ruairi/repos/signal_processing';
addpath(genpath(folder_path));
%%

load('emg4TKEO.mat')

%%
filtered = tkeo(emg);

%% normalise

filtered_normed = zscore(filtered);
emg_normed = zscore(emg);


%%
figure(1), clf
subplot(211)
plot(emgtime, emg), hold on
plot(emgtime, filtered)
title('TKEO of EMG')
hold off

subplot(212)
plot(emgtime, emg_normed), hold on
plot(emgtime, filtered_normed)
title('Z score normalised')
hold off