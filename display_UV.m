function display_UV(X)

h1 = [-1 2 6 2 -1]/8;
h2 = [-1 2 -1]/4;

U = rowdec(X,h1);
V = rowdec2(X, h2);

draw([U V]);