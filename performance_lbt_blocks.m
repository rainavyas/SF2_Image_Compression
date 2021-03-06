function performance_lbt_blocks(X)

%To do stuff on pg 21 of handout

direct_bits = 2.28118*(10^5);
s = 1.4;


for N = [4,8,16]
    step = find_step_lbt(X,N,s);
    Y = do_lbt(X, N, s);
    Yq = quantise(Y,step);
    Yr = regroup(Yq,N)/N;
    bits = dctbpp(Yr, 16);
    ratio = direct_bits/bits;
    disp("block size: "+N+" step "+step+" ratio "+ratio);
    
    figure(N);
    Z = do_ilbt(Yq, N, s);
    draw(Z);
    
end

return
    