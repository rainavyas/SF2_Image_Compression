function [Yq, dwtent] = quantdwt(Y, dwtstep)

% dwtstep is 3 x (n+1) matrix, where n is the dwt levels
% Function to quantise sub-images of dwt image, Y, where the quantiser step
% for each sub-image k at level i is dwtstep(k,i)
% Low pass image at level n is quantised using dwtstep(1,n+1)

[rows, cols] = size(dwtstep);
n = cols -1;

%matrix to store entropy (bits/pixel) of each sub-image
dwtent = zeros(rows, cols);

Yq = Y;
%quantise each sub-image
for i = 1:n
    a = 1:256/(2^i);
    b = 256/(2^i)+1 :256/(2^(i-1));
    Yq(a,b) = quantise(Y(a,b),dwtstep(1,i));
    Yq(b,a) = quantise(Y(b,a),dwtstep(2,i));
    Yq(b,b) = quantise(Y(b,b),dwtstep(3,i));

    dwtent(1,i) = bpp(Yq(a,b));
    dwtent(2,i) = bpp(Yq(b,a));
    dwtent(3,i) = bpp(Yq(b,b)); 
end

%quantise the small low-pass image
a = 1:256/(2^n);
Yq(a,a) = quantise(Y(a,a),dwtstep(1,n+1));
dwtent(1,n+1) = bpp(Yq(a,a));

return