function [EY0, EY1, EY2, EY3, EX1, EX2, EX3, EX4] = find_energy_of_impulse(h)

%This function finds the energy of reconstructed image from pyramid with an
%impulse of 100 in a layer of the pyramid (everthing else is zero)

X = zeros(256);

X1 = quarter_size_lowpass(X, h);
Y0 = highpass_from_decimated_lowpass(X, h);

X2 = quarter_size_lowpass(X1, h);
Y1 = highpass_from_decimated_lowpass(X1, h);

X3 = quarter_size_lowpass(X2, h);
Y2 = highpass_from_decimated_lowpass(X2, h);

X4 = quarter_size_lowpass(X3, h);
Y3 = highpass_from_decimated_lowpass(X3, h);

%impulse in Y0
IY0 = add_impulse(Y0);
Z0 = transpose(rowint(transpose(rowint(X1, 2*h)), 2*h)) + IY0;
EY0 = sum(Z0(:).^2);

%impulse in X1
IX1 = add_impulse(X1);
Z0 = transpose(rowint(transpose(rowint(IX1, 2*h)), 2*h)) + Y0;
EX1 = sum(Z0(:).^2);

%impulse in Y1
IY1 = add_impulse(Y1);
Z1 = transpose(rowint(transpose(rowint(X2, 2*h)), 2*h)) + IY1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EY1 = sum(Z0(:).^2);

%impulse in X2
IX2 = add_impulse(X2);
Z1 = transpose(rowint(transpose(rowint(IX2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EX2 = sum(Z0(:).^2);

%impulse in Y2
IY2 = add_impulse(Y2);
Z2 = transpose(rowint(transpose(rowint(X3, 2*h)), 2*h)) + IY2;
Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EY2 = sum(Z0(:).^2);

%impulse in X3
IX3 = add_impulse(X3);
Z2 = transpose(rowint(transpose(rowint(IX3, 2*h)), 2*h)) + Y2;
Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EX3 = sum(Z0(:).^2);

%impulse in Y3
IY3 = add_impulse(Y3);
Z3 = transpose(rowint(transpose(rowint(X4, 2*h)), 2*h)) + IY3;
Z2 = transpose(rowint(transpose(rowint(Z3, 2*h)), 2*h)) + Y2;
Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EY3 = sum(Z0(:).^2);

%impulse in X4
IX4 = add_impulse(X4);
Z3 = transpose(rowint(transpose(rowint(IX4, 2*h)), 2*h)) + Y3;
Z2 = transpose(rowint(transpose(rowint(Z3, 2*h)), 2*h)) + Y2;
Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;
EX4 = sum(Z0(:).^2);


return