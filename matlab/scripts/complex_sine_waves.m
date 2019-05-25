% create a complex sine wave

folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
fs = 1/0.001;
t = 0:1/fs:10;
f = 2;
csw = create_complex_sine(f, t);

%% plot in time domaine

figure(1), clf
subplot(311)
plot(t, real(csw))
title('real part')
xlabel('time')

subplot(312)
plot(t, imag(csw))
title('immaginary part')
xlabel('time')

subplot(313)
plot3(t, real(csw), imag(csw))
title('complex sine')
xlabel('time')
ylabel('real part')
zlabel('imaginary part')

%% plot in frequency domaine

nfft = length(csw);
coefs = rfft(csw);
hz = rfftfreq(nfft, fs);

figure(2), clf
plot(hz, 2 * abs(coefs))
xlim([0, f+5])
ylim([0, max(2 * abs(coefs)) + 1])
xlabel('frequency [Hz]')
ylabel('amplitude')

%% effect of zero padding

nffts = ([length(csw), length(csw) + 1000]);
hz = [length(rfftfreq(nffts(1), fs)), length(rfftfreq(nffts(2), fs))];
bar(hz)
xticklabels({'Original signal', 'Padded with 1000 zeros'})
title('Zero padding increases frequency resolution')
ylabel('Number of frequencies')
