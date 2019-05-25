function [wavelets, frequencies] = wavelet_range(min_f, max_f, num_f, wt, cycles_min, cycles_max)

    if nargin < 5
        cycles_min = 4;
        cycles_max = 10;
    end

    frequencies = logspace(log10(min_f), log10(max_f), num_f);
    cycles = logspace(log10(cycles_min), log10(cycles_max), num_f);
    wavelets = zeros(num_f, length(wt));
    for i = 1:num_f
        wavelets(i, :) = create_wavelet(wt, cycles(i), frequencies(i));
    end
end