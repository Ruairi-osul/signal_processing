function hz = rfftfreq(nfft, fs)
    % calculate the frequencies for postive fourier coefs of a signal
    nyq = fs / 2;
    num_f = floor(nfft / 2) + 1;
    hz = linspace(0, nyq, num_f);
end