%%
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))

%% create the wavelet
wt = -2:1/256:2;
f = 2;
cycles = 7;
cycles2 = 2;

wavelet1 = create_wavelet(wt, cycles, f);
wavelet2 = create_wavelet(wt, cycles2, f);

%% in time domaine

figure(1), clf
subplot(221)
plot(wt, real(wavelet1))
title('many cycles')
xlabel('Time')

subplot(223)
plot(wt, real(wavelet2))
title('few cycles')
xlabel('Time')

%%

coefs1 = rfft(wavelet1);
hz1 = rfftfreq(length(wavelet1), 256);

coefs2 = rfft(wavelet2);
hz2 = rfftfreq(length(wavelet2), 256);


figure(1)
subplot(222)
plot(hz1, 2 * abs(coefs1))
title('many cycles')
xlabel('[Hz]')
xlim([0,10])
ylabel('amplitude')

subplot(224)
plot(hz2, 2 * abs(coefs2))
title('few cycles')
xlabel('[Hz]')
xlim([0,10])
ylabel('amplitude')
