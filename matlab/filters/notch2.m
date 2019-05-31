function filtered_sig = notch2(sig, fs, freq, q_factor)
    % apply a notcg 
    if nargin < 4
        q_factor = 35;
    end
    wo = freq / (fs / 2);
    bw = wo / q_factor;
    [b, a] = iirnotch(wo, bw);
    filtered_sig = filtfilt(b, a, double(sig));