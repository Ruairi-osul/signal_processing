function a_sig = hilbert_manual(sig)
    % never actually use this

    n = length(sig);

    % take fft of the signal
    sigX = fft(sig);

    % rotate the around the complex axis
    posf_idx = 2:(floor(n / 2) + mod(n, 2));
    negf_idx = ((ceil(n / 2) + 1) + mod(n, 2) ):n;

    % positive by -i
    sigX(posf_idx) = sigX(posf_idx) + (-1i * sigX(posf_idx));
    % negative by i
    sigX(negf_idx) = sigX(negf_idx) + (1i * sigX(negf_idx));
    
    a_sig = ifft(sigX);

end