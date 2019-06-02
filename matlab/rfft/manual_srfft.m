function [tf, hz, fft_centres] = manual_srfft(sig, nfft, fs)
    

    % define windows
    half_window = nfft / 2;
    fist_centre = 1 + round(half_window);
    last_centre = length(sig) - round(half_window )- 1;
    fft_centres = fist_centre:nfft:last_centre;
    num_centres = length(fft_centres);

    % define hanning window
    han_win = 0.5 - (0.5 * cos(2 * pi .*linspace(0, 1, nfft)));
    
    % define f
    num_f = floor(nfft / 2) + 1;
    nyq = floor(fs / 2);
    hz = linspace(0, nyq, num_f);

    % run srfft
    tf = zeros(num_f, num_centres);
    for i = 1:num_centres
        start_idx = fft_centres(i) - floor(half_window) + 1;
        end_idx = fft_centres(i) + ceil(half_window);
        data_sub = sig(start_idx:end_idx);
        data_sub = bsxfun(@times, data_sub, han_win);
        data_subX = fft(data_sub) ./ nfft;
        pow = abs(data_subX).^2;
        tf(:, i) = pow(1:num_f);
    end
    
end