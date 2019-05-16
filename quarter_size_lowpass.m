function X1 = quarter_size_lowpass(X, h)

% Low pass filtered Image is decimated (sub-sampled) 2:1 in both horizontal
% and vertical directions

%h = [0.25, 0.5, 0.25];

X_row_dec = rowdec(X, h);
X1 = transpose(rowdec(transpose(X_row_dec), h));

%draw(X1)

return