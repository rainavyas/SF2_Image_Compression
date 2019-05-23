function Z = nlevidwt(Yq, n)

m = 256/(2^n);

Z = Yq;

for i = 1:n
    t=1:(2*m);
    Z(t,t)=idwt(Z(t,t));
    m = 2*m;
end

return

