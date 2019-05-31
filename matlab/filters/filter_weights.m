function fweights = filter_weights(fs, low, high, ideal_response, forder, transition_width)
    % get filter weights for a band pass filter
    % forder is the the order of the filter
    %   higher orders give better frerquency precision but worse time preceision
    % ideal response is the ideal response at the 6 points defined by the frequencies should be something like [0, 0, 1, 1, 0, 0]
    % 

    if nargin < 4
        ideal_response = [0, 0, 1, 1, 0, 0];
    end
    if nargin < 5
        forder = 3;
    end
    if nargin < 6
        transition_width = 0.2;
    end

    nyq = fs / 2;
    
    % set the filter order
    forder = round(forder * (fs / low));

    % set the filter frequencies
    ff = [0, (1 - transition_width) * low, low, high, high * (1 + transition_width), nyq]./nyq;

    % set the ideal responses 

    % get filter weights
    fweights = firls(forder, ff, ideal_response);
    