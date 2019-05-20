function Y = do_2D_dct(X, N)
% This function performs the 2D DCT on X and also find error of
% reconstructed image

CN = dct_ii(N);
Y = colxfm(colxfm(X,CN)', CN)';

% Display the regrouped frequency domain DCT image
N = 8;
%draw(regroup(Y,N)/N);

% Check inverse DCT reconstruction is identical to orginal
Z = colxfm(colxfm(Y',CN')',CN');
diff = abs(Z-X);
val = max(max(diff));
%disp(val);

return