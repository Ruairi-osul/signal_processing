function filtered_sig = bandpass2(sig, fs, low, high, forder, transition_width)
    % bandpass filter a signal between low and high

    if nargin < 5
        forder = 3;
    end
    if nargin < 6
        transition_width = 0.2;
    end

    ideal_response = [0, 0, 1, 1, 0, 0];
    fweights = filter_weights(fs, low, high, ideal_response, forder, transition_width);
    filtered_sig = filtfilt(fweights, 1, double(sig));