function bits = find_total_bits_mse(n, step, X, h)

%Find the bits required to code a n-layered pyramid with quantisation level
%of step for Y0 and ratios determine remaining quantisation levels

ratio1 = 0.91428;
ratio2 = 0.50618;
ratio3 = 0.25886;
ratio4 = 0.130145;
size = 256;

X1 = quarter_size_lowpass(X, h);
Y0 = highpass_from_decimated_lowpass(X, h);

X2 = quarter_size_lowpass(X1, h);
Y1 = highpass_from_decimated_lowpass(X1, h);

X3 = quarter_size_lowpass(X2, h);
Y2 = highpass_from_decimated_lowpass(X2, h);

X4 = quarter_size_lowpass(X3, h);
Y3 = highpass_from_decimated_lowpass(X3, h);

bX1 = bpp(quantise(X1,ratio1*step));
bX2 = bpp(quantise(X2,ratio2*step));
bX3 = bpp(quantise(X3,ratio3*step));
bX4 = bpp(quantise(X4,ratio4*step));
bY0 = bpp(quantise(Y0,step));
bY1 = bpp(quantise(Y1,ratio1*step));
bY2 = bpp(quantise(Y2,ratio2*step));
bY3 = bpp(quantise(Y3,ratio3*step));

switch n
    case 1
        bits = (bY0*(size^2))+(bX1*((size/2)^2));
    case 2
        bits = (bY0*(size^2))+(bY1*((size/2)^2))+(bX2*((size/4)^2));
    case 3
        bits = (bY0*(size^2))+(bY1*((size/2)^2))+(bY2*((size/4)^2))+(bX3*((size/8)^2));
    case 4
        bits = (bY0*(size^2))+(bY1*((size/2)^2))+(bY2*((size/4)^2))+(bY3*((size/8)^2))+(bX4*((size/16)^2));
    otherwise
        bits = 0;
end

return