function display_UV(X)

% dwt pg 24 top box

h1 = [-1 2 6 2 -1]/8;
h2 = [-1 2 -1]/4;

U = rowdec(X,h1);
V = rowdec2(X, h2);

draw([U V]);

EU = sum(U(:).^2);
EV = sum(V(:).^2);

disp(EU);
disp(EV);

return;