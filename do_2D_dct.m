function Y = do_2D_dct(X)
% This function performs the 2D DCT on X and also find error of
% reconstructed image

C8 = dct_ii(8);
Y = colxfm(colxfm(X,C8)', C8)';

% Display the regrouped frequency domain DCT image
N = 8;
draw(regroup(Y,N)/N);

% Check inverse DCT reconstruction is identical to orginal
Z = colxfm(colxfm(Y',C8')',C8');
diff = abs(Z-X);
val = max(max(diff));
disp(val);

return