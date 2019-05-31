clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')


%%

p = 'C:\Users\Rory\Downloads\anna.csv';
anna = csvread(p);

fs = 4000;
annaX = rfft(anna);
hz = rfftfreq(length(anna), fs);

%% where anna is the data array

q_factor = 35;
to_filter = 50;
wo = to_filter / (fs/2);
bw = wo / q_factor;
[b, a] = iirnotch(wo, bw);
anna_f = filtfilt(b, a, anna);
%%
annaXf = rfft(anna_f);
hzf = rfftfreq(length(anna_f), fs);

%%

figure(1), clf
subplot(211)
plot(hz, abs(annaX).^2)
xlabel('frequency [Hz]')
ylabel('power')
xlim([0, 5])

subplot(212)
plot(hzf, abs(annaXf).^2)
xlabel('frequency [Hz]')
ylabel('power')
xlim([0, 5])


%%