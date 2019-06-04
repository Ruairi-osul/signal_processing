function normalised_sig = percent_normalise(data, ref)
    tmp = bsxfun(@minus, data, ref);
    normalised_sig = 100 * bsxfun(@rdivide, tmp, ref);
end