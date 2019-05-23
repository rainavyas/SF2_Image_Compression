function [UU UV VU VV] = display_UU(X)

% second box pg 24 (dwt scheme)

h1 = [-1 2 6 2 -1]/8;
h2 = [-1 2 -1]/4;

U = rowdec(X,h1);
V = rowdec2(X, h2);

k=2.5;

UU = rowdec(U', h1)';
UV = rowdec2(U', h2)';
VU = rowdec(V', h1)';
VV = rowdec2(V', h2)';


draw([UU (k*VU); k*UV k*VV]);

return