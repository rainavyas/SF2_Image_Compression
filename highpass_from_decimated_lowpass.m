function Y0 = highpass_from_decimated_lowpass(X)

h = [0.25, 0.5, 0.25];
X1 = quarter_size_lowpass(X);

X1_row = rowint(X1, 2*h);
X1_full = transpose(rowint(transpose(X1_row), 2*h));

Y0 = X - X1_full;

%figure(1);
%draw(X1);

%figure(2);
%draw(Y0);


return