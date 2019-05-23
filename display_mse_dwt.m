function display_mse_dwt(X)

%Change based on image
%Bridge
REF = 2.370502656*(10^5); 
%Lighthouse
%REF = 2.28118*(10^5);

ratios = [1.3844 1.3844 1 1.9167; 0.90283 0.90283 0.77966 1.0455; 0.49235 0.49235 0.4532 0.53488; 0.25207 0.25207 0.2362 0.26901; 0.1268 0.1268 0.11936 0.1347; 0.063497 0.063947 0.059842 0.067375];
ratios = ratios';

for level = 1:6
    Y = nlevdwt(X,level);
    step = find_step_dwt_mse(X, level);
    %Create quantisation matrix
    dwstep = zeros(3, level+1);
 
    for col = 1:level
        for row = 1:3
            dwstep(row, col) = ratios(row, col)*step;
        end
    end
    dwstep(1,level+1) = ratios(4, level)*step;
    [Yq, dwtent] = quantdwt(Y, dwstep);
    bits = dwt_ent_mat_bits(dwtent);
    ratio = REF/bits;
    
    disp("Level: "+level+" step: "+step+" bits: "+bits+" ratio: "+ratio);

end

return