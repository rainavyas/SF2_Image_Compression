function X1 = quarter_size_lowpass(X)

% Low pass filtered Image is decimated (sub-sampled) 2:1 in both horizontal
% and vertical directions

h = [0.25, 0.5, 0.25];

X_row_dec = rowdec(X, h);
X1 = rowdec(transpose(X_row_dec), h);

return