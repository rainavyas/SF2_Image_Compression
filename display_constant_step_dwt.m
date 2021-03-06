function display_constant_step_dwt(X)

%Change based on image
REF = 2.370502656*(10^5);

for level = 1:6
    Y = nlevdwt(X,level);
    step = find_step_dwt(X, level);
    dwtstep = ones(3, level+1);
    dwtstep = step * dwtstep;
    [Yq, dwtent] = quantdwt(Y, dwtstep);
    bits = dwt_ent_mat_bits(dwtent);
    ratio = REF/bits;
    
    disp("Level: "+level+" step: "+step+" bits: "+bits+" ratio: "+ratio);

end

return