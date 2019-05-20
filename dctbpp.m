function bits = dctbpp(Yr, N)

%This function finds the bits required to transmit a regrouped quantised 
%dct image Yr by finding the entropy of each sub-image separately.
%N is the size of DCT block e.g. 8x8

% number of sub-images = N^2 (number of pixels in each N x N block)
% pixels in each sub-image = (256/N) x (256/N)
SIZE = 256/N;

total = 0;
for i = 0:N-1
    for j = 0:N-1
        per_pixel = bpp(Yr(SIZE*i+1:SIZE*(i+1),SIZE*j+1:SIZE*(j+1)));
        per_block = per_pixel * (SIZE^2);
        total = total + per_block;
    end
end

bits = total;

return