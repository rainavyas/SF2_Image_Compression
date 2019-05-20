function find_steps_total_bits_8b8_lbt(X,N)

%Function to find step size for different s in LBT to match direct
%scheme quantisation and thus compression ratios

direct_bits = 2.28118*(10^5);

for s = 1:0.1:2
    step = find_step_lbt(X,N,s);
    Y = do_lbt(X, N, s);
    Yq = quantise(Y,step);
    Yr = regroup(Yq,N)/N;
    bits = dctbpp(Yr, N);
    ratio = direct_bits/bits;
    disp("s:"+s+" step: "+step+" bits: "+bits+" ratio: "+ratio);
end  
    
return