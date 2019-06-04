folder_path = '/home/ruairi/repos/signal_processing';
addpath(genpath(folder_path));
%%

load('denoising_codeChallenge.mat')


%%

filtered = medfilt1(origSignal, 50);
filtered = mean_filter_td(filtered, 201);

%%

figure(1), clf
subplot(311)
plot(origSignal)

subplot(312)
plot(cleanedSignal)

subplot(313)
plot(filtered)