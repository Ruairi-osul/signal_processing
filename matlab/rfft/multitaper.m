function [tf, hz, timepoints] = multitaper(sig, num_tapers, t, fs, window, interval)

    nfft = round(window * fs);
    half_window = nfft / 2;

    if nargin < 6
        interval = window / 2;
    end

    first_seg = t(1 + round(half_window));
    last_seg = t(end - round(half_window));
    fft_centres = first_seg:interval:last_seg;
    fft_centres_idx = get_idx(t, fft_centres);
    timepoints = t(fft_centres_idx);

    num_f = floor(nfft / 2) + 1;
    nyq = fs / 2;
    hz = linspace(0, nyq, num_f);

    tapers = dpss(nfft, num_tapers);
    [data_length, num_tapers] = size(tapers);
    tmp_tapers = zeros(num_tapers, data_length);
    tf = zeros(num_f, length(timepoints));

    for i = 1:length(timepoints)
        start_idx = fft_centres_idx(i) - floor(half_window) + 1; 
        end_idx = fft_centres_idx(i) + ceil(half_window);
        data_sub = sig(start_idx:end_idx);
        for j = 1:num_tapers
            tapered_data = bsxfun(@times, data_sub, tapers(:, j)');
            tapered_dataX = fft(tapered_data) ./ data_length;
            pow = abs(tapered_dataX) .^ 2;
            tmp_tapers(j, :) = pow;
        end
        mean_power = mean(tmp_tapers, 1);
        tf(:, i) = mean_power(1:num_f);
    end