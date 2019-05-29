function res = itpc(tf)
    % given a 3D tensor (frequency x time x trial)
    % calculates itpc across frequencies

    angles = angle(tf);
    vectors = exp(1i * angles);
    mean_vec = mean(vectors, 3); % mean along trial
    length_of_mean_vector = abs(mean_vec);
    res = length_of_mean_vector;