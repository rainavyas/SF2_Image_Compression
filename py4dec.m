function diff = py4dec(Y0, Y1, Y2, Y3, X4, X, h)


%h = [0.25, 0.5, 0.25];
Z3= transpose(rowint(transpose(rowint(X4, 2*h)), 2*h)) + Y3;
Z2 = transpose(rowint(transpose(rowint(Z3, 2*h)), 2*h)) + Y2;
Z1 = transpose(rowint(transpose(rowint(Z2, 2*h)), 2*h)) + Y1;
Z0 = transpose(rowint(transpose(rowint(Z1, 2*h)), 2*h)) + Y0;

draw(beside(Z0, beside(Z1, beside(Z2, Z3))));

diff = max(abs(X(:) - Z0(:)));

return