function step = find_step_dwt_mse(X,n)

%Function to find the required quantisation for bottom right img in dwt mse
%compression scheme

%Define ratios matrix 4x6
%going down rows: img1, img2, img3, imgLOW
%going along columns: increasing levels
ratios = [1.3844 1.3844 1 1.9167; 0.90283 0.90283 0.77966 1.0455; 0.49235 0.49235 0.4532 0.53488; 0.25207 0.25207 0.2362 0.26901; 0.1268 0.1268 0.11936 0.1347; 0.063497 0.063947 0.059842 0.067375];
ratios = ratios';

% Direct quantisation scheme
Z = quantise(X, 17);
rms_error = std(X(:)-Z(:));

% DWT scheme
Y = nlevdwt(X, n);

best = [1000, -1];

for m = 100:1500
    i = m/100;
    %Create quantisation matrix
    dwstep = zeros(3, n+1);
 
    for col = 1:n
        for row = 1:3
            dwstep(row, col) = ratios(row, col)*i;
        end
    end
    dwstep(1,n+1) = ratios(4, n)*i;
    
    [Yq, dwtent] = quantdwt(Y, dwstep);
    Z_dwt = nlevidwt(Yq, n);
    error = std(X(:)-Z_dwt(:));
    if abs(error - rms_error) < abs(best(1) - rms_error)
        best = [error, i];
    end
end
step = best(2);

return