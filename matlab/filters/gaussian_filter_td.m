function filtered = gaussian_filter_td(sig, fs, win, fwhm)

    % create the gaussian
    k = round( (win - 1) / 2 );
    gtime =  1000 * (-k:k) ./ fs;
    gaussian = exp( -(4 * log(2) * gtime .^ 2) / (fwhm ^ 2) );
    gaussian = gaussian / sum(gaussian); % normalise to unit energy

    % filter the signal
    filtered = sig; %intialise with the signal to deal with edge effects
    n = length(sig);
    % slide the gausian over the data, multipling each point weighted
    for i = (k + 1):(n - k - 1)
        filtered(i) = sum( sig((i - k):(i + k)) .* gaussian );
    end
end