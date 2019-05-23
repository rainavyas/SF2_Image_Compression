function Y = nlevdwt(X,n)

%Perform multi-level dwt

m=256;
Y=X;

for i = 1:n
    t=1:m;
    Y(t,t)=dwt(Y(t,t));
    m = m/2;
end

return