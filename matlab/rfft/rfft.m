function coefs = rfft(signal, nfft)
    % calculate fourier coefs for positive frequencies of a signal
    n_samps = length(signal);
    if nargin < 2
        nfft = n_samps;
    end
    num_f = floor(nfft/2) + 1;
    coefs = fft(signal) / nfft;
    coefs = coefs(1:num_f);
end