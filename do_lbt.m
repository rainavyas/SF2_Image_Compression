function Y = do_lbt(X, N, s)

% This function performs the LBT by pre-filtering (POT) first and then
% applying the DCT as before.

I = 256;
[Pf Pr] = pot_ii(N, s);

%Do POT
t = [(1+N/2):(I-N/2)];
Xp = X;
Xp(t,:)=colxfm(Xp(t,:), Pf);
Xp(:,t) = colxfm(Xp(:,t)',Pf)';

%Do DCT
Y = do_2D_dct(Xp,N);

return