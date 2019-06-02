function normalised_data = db_normalise_fun(data, t, basetimepoints)
    base_idx = get_idx(t, basetimepoints);
    base_data = mean(data(base_idx(1):base_idx(2)), 2);  % maybe not transferable
    normalised_data = db_normalise(data, base_data);
end