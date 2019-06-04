function sig = brownian_noise(n)
    sig = cumsum(randn(n, 1));
end