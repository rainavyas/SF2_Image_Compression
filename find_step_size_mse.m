function [step1, step2, step3, step4] = find_step_size_mse(X, Y0, Y1, Y2, Y3, step, h)

% The image X is quantised by step and the rms error is found. stepn is the
% required step size to quantise Y0 of a n-layer pyramid that finds the most
% similar rms error -- quantisation ratios of layers is made so that all
% layers have approximately the same error contribution to the
% reconstructed image.


ratio1 = 0.91428;
ratio2 = 0.50618;
ratio3 = 0.25886;
ratio4 = 0.130145;

Z = quantise(X,step);
rms_error = std(X(:)-Z(:));

% 1-layer pyramid
X1 = quarter_size_lowpass(X, h);
best = [1000, -1];

for m = 1:2000
    n = m/100;
    Z0 = transpose(rowint(transpose(rowint(quantise(X1,ratio1*n), 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step1 = best(2);

% 2-layer pyramid
X2 = quarter_size_lowpass(X1, h);
best = [1000, -1];

for m = 1:2000
    n = m/100;
    Z1 = transpose(rowint(transpose(rowint(quantise(X2,ratio2*n), 2*h)), 2*h)) + quantise(Y1,ratio1*n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step2 = best(2);

% 3-layer pyramid
X3 = quarter_size_lowpass(X2, h);
best = [1000, -1];

for m = 1:2000
    n= m/100;
    Z2 = transpose(rowint(transpose(rowint(quantise(X3,ratio3*n), 2*h)), 2*h)) + quantise(Y2,ratio2*n);
    Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + quantise(Y1,ratio1*n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step3 = best(2);


% 4-layer pyramid
X4 = quarter_size_lowpass(X3, h);
best = [1000, -1];

for m = 1:2000
    n= m/100;
    Z3 = transpose(rowint(transpose(rowint(quantise(X4,ratio4*n), 2*h)), 2*h)) + quantise(Y3,ratio3*n);
    Z2 = transpose(rowint(transpose(rowint(Z3, 2*h)), 2*h)) + quantise(Y2,ratio2*n);
    Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + quantise(Y1,ratio1*n);
    Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + quantise(Y0,n);
    error = std(X(:)-Z0(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, n];
    end
end
step4 = best(2);

return