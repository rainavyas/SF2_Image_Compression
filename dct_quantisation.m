function Yr = dct_quantisation(Y, step, N)

Yq = quantise(Y, step);
Yr = regroup(Yq,N)/N;