function I = add_impulse(X)

%Add impulse of 100 at centre of image

dim = size(X);
len = dim(1);
mid = len/2;

X(mid,mid) = 100;

I = X;

return