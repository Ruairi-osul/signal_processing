function ind = get_chan_ind(name, data)
    ind = find(strcmpi(name, {data.chanlocs.labels}));
end