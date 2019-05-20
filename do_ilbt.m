function Zp = do_ilbt(Y,N,s)

%Performs inverse LBT by performing inverse DCT and then inverse POT

%Inverse DCT
Z = do_2D_idct(Y,N);

%Inverse POT
I = 256;
[Pf Pr] = pot_ii(N, s);
t = [(1+N/2):(I-N/2)];
Zp = Z;
Zp(:,t) = colxfm(Zp(:,t)', Pr')';
Zp(t,:) = colxfm(Zp(t,:),Pr');


return