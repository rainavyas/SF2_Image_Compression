function bits = dwt_ent_mat_bits(dwtent)

%Function to go from the entropies of sub-images matrix to the bots
%required to encode the entire dwt n-level image

[rows, cols] = size(dwtent);

n = cols -1;
bits = 0;

for i = 1:n
    img_size = 256/(2^i);
    for k = 1:rows
        bits = bits + (img_size^2)*dwtent(k,i);
    end
end

%last low pass image
img_size = 256/(2^n);
bits = bits + (img_size^2)*dwtent(1,n+1);

return
