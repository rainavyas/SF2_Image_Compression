function [step0, step1, step2, step3, step4] = find_step_size(X, Y0, Y1, Y2, Y3, step)

% The image X is quantised by step and the rms error is found. stepn is the
% required step size to quantise a n-layer pyramid that finds the most
% similar rms error

h = [0.25, 0.5, 0.25];
step0 = step;

Z = quantise(X,step);
rms_error = std(X(:)-Z(:));

% 1-layer pyramid
X1 = quarter_size_lowpass(X);
best = [1000, -1];

for n = 1:40
    Z0 = transpose(rowint(transpose(rowint(quantise(X1,n), 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step1 = best(2);

% 2-layer pyramid
X2 = quarter_size_lowpass(X1);
best = [1000, -1];

for n = 1:40
    Z1 = transpose(rowint(transpose(rowint(quantise(X2,n), 2*h)), 2*h)) + quantise(Y1,n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step2 = best(2);

% 3-layer pyramid
X3 = quarter_size_lowpass(X2);
best = [1000, -1];

for n = 1:40
    Z2 = transpose(rowint(transpose(rowint(quantise(X3,n), 2*h)), 2*h)) + quantise(Y2,n);
    Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + quantise(Y1,n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step3 = best(2);


% 4-layer pyramid
X4 = quarter_size_lowpass(X3);
best = [1000, -1];

for n = 1:40
    Z3 = transpose(rowint(transpose(rowint(quantise(X4,n), 2*h)), 2*h)) + quantise(Y3,n);
    Z2 = transpose(rowint(transpose(rowint(Z3, 2*h)), 2*h)) + quantise(Y2,n);
    Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + quantise(Y1,n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step4 = best(2);

return