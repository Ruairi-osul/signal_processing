function coefs =  manual_rfft(signal)
    % never actually use this

    num_samps = length(signal);

    % create normalised time vector
    fft_time = linspace(0, num_samps, num_samps) ./ num_samps;
    coefs= zeros(size(signal));

    % loop over each time point
    for f = 1:num_samps
        % create complex sine wave with frequency == sample index
        sine = exp(2 * pi * f .* fft_time);
        
        % unnormalised coef is the inner product between the sig and wave
        coefs(f, :) = dot(sine, signal);
    end
    
    % normalise the coefs
    coefs = coefs ./ n_samps;

    % extract coefs of real frequencies
    coefs = coefs(1:(floor(num_samps/2)+1));
