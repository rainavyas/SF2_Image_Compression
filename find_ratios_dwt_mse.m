function find_ratios_dwt_mse(n)

%Displays the energies of each sub-images impulse response of impulse
%amplitude 100 at centre, for up to n level dwt

ref = 82656.25;

for i = 1:n
    
    a = 1:256/(2^i);
    b = 256/(2^i)+1 :256/(2^(i-1));
    
    %energy of 1, at level i
    img = zeros(256);
    img(a,b) = add_impulse(img(a,b));
    out_img = nlevidwt(img, n);
    energy1 = sum(out_img(:).^2);
    ratio1 = sqrt(ref/energy1);
    
    %energy of 2, at level i
    img = zeros(256);
    img(b,a) = add_impulse(img(b,a));
    out_img = nlevidwt(img, n);
    energy2 = sum(out_img(:).^2);
    ratio2 = sqrt(ref/energy2);
    
    %energy of 3, at level i
    img = zeros(256);
    img(b,b) = add_impulse(img(b,b));
    out_img = nlevidwt(img, n);
    energy3 = sum(out_img(:).^2);
    ratio3 = sqrt(ref/energy3);
    
    %energy of low-pass, at level i
    img = zeros(256);
    img(a,a) = add_impulse(img(a,a));
    out_img = nlevidwt(img, i);
    energy4 = sum(out_img(:).^2);
    ratio4 = sqrt(ref/energy4);
    
    disp("LEVEL: "+i);
    disp("1: "+energy1+" 2: "+energy2+" 3: "+energy3+" LOW: "+energy4);
    disp("1: "+ratio1+" 2: "+ratio2+" 3: "+ratio3+" LOW: "+ratio4);
    

end


return