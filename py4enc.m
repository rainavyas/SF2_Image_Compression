function [Y0, Y1, Y2, Y3, X4] = py4enc(X)

%Generate a 4-layer pyramid, so that X is split into Y0, Y1, Y2, Y3 and X4


X1 = quarter_size_lowpass(X);
Y0 = highpass_from_decimated_lowpass(X);

X2 = quarter_size_lowpass(X1);
Y1 = highpass_from_decimated_lowpass(X1);

X3 = quarter_size_lowpass(X2);
Y2 = highpass_from_decimated_lowpass(X2);

X4 = quarter_size_lowpass(X3);
Y3 = highpass_from_decimated_lowpass(X3);

draw(beside(Y0, beside(Y1, beside(Y2, beside(Y3,X4)))));

return


