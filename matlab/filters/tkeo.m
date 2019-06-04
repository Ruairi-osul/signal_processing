function filtered = tkeo(sig)
    filtered = zeros(size(sig));
    filtered(2:(end-1)) = (sig(2:(end-1)) .^ 2) - (sig(1:(end-2)) .* ...
                                            sig(3:end));
end