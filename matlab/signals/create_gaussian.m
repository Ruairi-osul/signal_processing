function gaus = create_gaussian(x, sd)
    % create a gausian centred 0 using x 
    % with sd standard deviationgiven
    gaus = exp( -(x.^2) ./ (2*sd.^2));
end