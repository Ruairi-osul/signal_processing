function [tf, hz, timepoints] = manual_srfft_fun(sig, t, fs, window, interval, kernel)
    % where window is in ms
    

    nfft = round(window * fs);
    half_window = nfft / 2;

    if nargin < 5
        interval = window / 2;
    end
    if nargin < 6
        kernel = 0.5 - (0.5 * cos(2 * pi .* linspace(0, 1, nfft)));
    end


    first_seg = t(1 + round(half_window));
    last_seg = t(end - round(half_window));
    fft_centres = first_seg:interval:last_seg;
    fft_centres_idx = get_idx(t, fft_centres);
    timepoints = t(fft_centres_idx);

    num_f = floor(nfft / 2) + 1;
    nyq = floor(fs / 2);
    hz = linspace(0, nyq, num_f);

    tf = zeros(num_f, length(timepoints));
    for i = 1:length(fft_centres)
        start_idx = fft_centres_idx(i) - floor(half_window) + 1;
        end_idx = fft_centres_idx(i) + ceil(half_window);
        data_sub = sig(start_idx:end_idx);
        data_sub = bsxfun(@times, data_sub, kernel);
        data_subX = fft(data_sub) ./ nfft;
        pow = abs(data_subX) .^ 2;
        tf(:, i) = pow(1:num_f);
    end
end