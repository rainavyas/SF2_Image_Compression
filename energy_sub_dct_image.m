function [E1, E2] = energy_sub_dct_image(X)

Y = do_2D_dct(X);
N=8;
G = regroup(Y,N)/N;

sub1 = G(1:8, 1:8);
sub2 = G((end-7):end, (end-7):end);

E1 = sum(sub1(:).^2);
E2 = sum(sub2(:).^2);

return