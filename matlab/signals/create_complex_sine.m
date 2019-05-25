function sine = create_complex_sine(f, t)
    % create a complex sine wave with frequency f over time t
    sine = exp(1i *2*pi*f.*t);
end