function simple_filtering(X, map)

h = halfcos(15);
% Use for loop to convolve 15-sample half cosine with each row
%{
 Xf = conv(h, X(1,:));

for i = 2:256
    next_row = conv(h, X(i,:));
    Xf = [Xf;next_row];
end

%Trim image and display
image(Xf(:,(1:256)+7));
colormap(map); 
%}

%Convolve all rows and trim in one command
Xf = conv2(1,h,X,'same');
draw(Xf);