function filtered = mean_filter_td(sig, winsize)

    filtered = sig;
    k = (winsize - 1) / 2;
    n = length(sig);
    for i = (1 + k):(n - k - 1)
        filtered(i) = mean(sig((i - k):(i + k)));
    end
end