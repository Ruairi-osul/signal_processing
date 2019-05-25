folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%% on a sine wive and a wavelet
f = 5;
fs = 256;
st = 0:1/fs:10;

s = create_complex_sine(f, st);

wt = -2:1/fs:2;
cycles = 7;

w = create_wavelet(wt, cycles, f);

sX = rfft(s);
shz = rfftfreq(length(s), fs);
wX = rfft(w);
whz = rfftfreq(length(w), fs);


%%
figure(1), clf
subplot(221)
plot(st, real(s))
title('Time domain')
ylim([-2, 2])

subplot(222)
plot(shz, 2*abs(sX))
title('Frequency domaine')
xlim([0, 10])

subplot(223)
plot(wt, real(w))
title('Time domain')

subplot(224)
plot(whz, 2*abs(wX))
title('Frequency domaine')
xlim([0, 10])

%% on a single trial and on an averaged trial

t = EEG.times;
fs = EEG.srate;
data_all = EEG.data(3, :, :);

single_trial = data_all(:, :, 10);
stX = rfft(single_trial);
sthz = rfftfreq(length(single_trial), fs);

erp = mean(data_all, 3);
erpX = rfft(erp);
erphz = rfftfreq(length(erp), fs);

%%
figure(2), clf
subplot(221)
plot(t, single_trial)
title('Single Trial')

subplot(222)
plot(sthz, 2*abs(stX))
title('Frequency domaine')
xlim([0, 20])

subplot(223)
plot(t, erp)
title('ERP')
xlabel('time')

subplot(224)
plot(erphz, 2*abs(erpX))
title('Frequency domaine')
xlim([0, 20])
