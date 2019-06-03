function f = instantaneous_frequency(sig, fs)

    a_sig = hilbert(sig);
    angles = unwrap(angle(a_sig));
    f = (diff(angles) * fs ) / (2 * pi);

end