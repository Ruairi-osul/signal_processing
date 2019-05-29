function [tf, f] = wavelet_fun(data, min_f, max_f, num_f, wt)
    n = length(data);
    nk = length(wt);
    half_kernel = (length(wt) - 1) / 2;
    nconv = n + nk - 1; 

    [wavelets, f] = wavelet_range(min_f, max_f, num_f, wt);

    dataX = fft(data, nconv);
    tf = zeros(num_f, n);
    for i = 1:num_f
        wavelet = wavelets(i, :);
        wX = fft(wavelet, nconv);
        wX = wX ./ max(wX);
        res = ifft(wX .* dataX);
        res = res((half_kernel + 1):(end -half_kernel));
        tf(i, :) = res;
    end