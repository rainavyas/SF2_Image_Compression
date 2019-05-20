function Z = do_2D_idct(Y, N)

%function to reconstruct image using inverse dct

CN = dct_ii(N);
Z = colxfm(colxfm(Y',CN')',CN');

%Find RMS error to original image
%RMS = std(X(:)-Z(:));
%disp(RMS);

return