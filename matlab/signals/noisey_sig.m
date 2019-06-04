function sig = noisey_sig(n, npoles, sig_amp, noise_amp)
    if nargin < 2
        npoles = 5;
    end
    if nargin < 3
        sig_amp = 30;
    end
    if nargin < 4
        noise_amp = 5;
    end

    sig = interp1(rand(npoles, 1) * sig_amp, linspace(1, npoles, n));
    noise = noise_amp * randn(1, n);
    sig = sig + noise;

end