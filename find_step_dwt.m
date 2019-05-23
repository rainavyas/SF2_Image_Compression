function step = find_step_dwt(X, n)

%Function to find the requried quantisation step for dwt scheme to give
%same RMS as direct quantisation

% Direct quantisation scheme
Z = quantise(X, 17);
rms_error = std(X(:)-Z(:));

% DWT scheme
Y = nlevdwt(X, n);

best = [1000, -1];

for m = 100:1500
    i = m/100;
    Yq = quantise(Y, i);
    Z_dwt = nlevidwt(Yq, n);
    error = std(X(:)-Z_dwt(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, i];
    end
end
step = best(2);

return