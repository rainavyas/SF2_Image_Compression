function step = find_step_lbt(X, N, s)

%Function to find the requried quantisation step for lbt scheme to give
%same RMS as direct quantisation

% Direct quantisation scheme
Z = quantise(X, 17);
rms_error = std(X(:)-Z(:));

% LBT scheme
Y = do_lbt(X, N, s);

best = [1000, -1];

for m = 1000:3000
    n = m/100;
    Yq = quantise(Y, n);
    Z_lbt = do_ilbt(Yq, N, s);
    error = std(X(:)-Z_lbt(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step = best(2);

return