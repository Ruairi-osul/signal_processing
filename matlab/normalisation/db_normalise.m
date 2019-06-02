function normalised_sig = db_normalise(data, reference)
    normalised_sig = 10 * log10(bsxfun(@rdivide, data, reference));
end