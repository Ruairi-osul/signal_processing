function idx = get_idx(reference, desired)
    % given a reference and a vector of desired closest, returns indexes of the
    % elements in the reference closest to each element in desired 
    % can be used when wanted to find the index of a timepoint closest to a desired timpoint
    idx = dsearchn(reference', desired');
end