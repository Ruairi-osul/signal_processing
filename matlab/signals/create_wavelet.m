function wavelet = create_wavelet(wt, cycles, f)
    % create a wavelet given a number of cycles and a frequency
    sd = cycles / (2*pi*f);
    gausian = create_gaussian(wt, sd);
    sine = create_complex_sine(f, wt);
    wavelet = gausian.*sine;
end