function reconstruct_dwt(UU, UV, VU, VV, X)

% reconstruction for dwt pg 24

g1 = [1 2 1]/2;
g2 = [-1 -2 6 -2 -1]/4;
Ur = rowint(UU', g1)'+rowint2(UV',g2)';
Vr = rowint(VU', g1)'+ rowint2(VV',g2)';

Xr = rowint(Ur, g1) + rowint2(Vr, g2);

diff = abs(Xr-X);
val = max(max(diff));
disp(val);