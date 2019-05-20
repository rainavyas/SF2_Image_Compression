function step = find_step_dct(X, C, N)

%find the required step size for quantising the dct image, Y so that the
%reconstructed image Z has same RMS error as direct scheme quantisation

% Direct quantisation scheme
Z = quantise(X, 17);
rms_error = std(X(:)-Z(:));

% DCT scheme
Y = do_2D_dct(X, N);

best = [1000, -1];

for m = 1000:3000
    n = m/100;
    Yq = quantise(Y, n);
    Z_dct = do_2D_idct(X, Yq, C);
    error = std(X(:)-Z_dct(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step = best(2);

return