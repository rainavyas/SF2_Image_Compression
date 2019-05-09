function val = separable_filter(X)

h = halfcos(15);

%row then column filtering
R1 = conv2se(1,h,X);
R2 = conv2se(1,h,transpose(R1));
R = transpose(R2);
draw(R);


%column then row filtering
C1 = conv2se(1,h,transpose(X));
C = conv2se(1,h,transpose(C1));
draw(C);

%find difference between images
diff = abs(R-C);
val = sum(sum(diff));
return