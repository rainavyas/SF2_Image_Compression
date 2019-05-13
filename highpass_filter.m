function highpass_filter(X)
   
odd_filter_length = 25;
h = halfcos(odd_filter_length);


low = conv2se(h,h,X);
high = X - low;

%display low pass filtered image
figure(100);
draw(low);

%display high pass filtered image
figure(101);
draw(high);
