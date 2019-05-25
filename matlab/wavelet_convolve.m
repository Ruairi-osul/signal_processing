function a_sig = wavelet_convolve(wavelet, data)
    % convolve a data array with a single wavelet
    nw = length(wavelet);
    nd = length(data);
    nconv = nw + nd - 1;
    half_kernel = (length(wavelet) -1) / 2;

    waveletX = fft(wavelet, nconv);
    waveletX = waveletX./max(waveletX);
    dataX = fft(data, nconv);

    a_sig = ifft(waveletX .* dataX);
    a_sig = a_sig(half_kernel+1:end-half_kernel);
end