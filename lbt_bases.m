function lbt_bases(X)

%Display the bases of Pf (pre-filtering step of LBT)
%Also display the corresponding prefiltered images Xp

N=8;
I = 256;

%s = 1
[Pf1 Pr] = pot_ii(N, 1);
t = [(1+N/2):(I-N/2)];
Xp1 = X;
Xp1(t,:)=colxfm(Xp1(t,:), Pf1);
Xp1(:,t) = colxfm(Xp1(:,t)',Pf1)';

bases1 = [zeros(1,8); Pf1'; zeros(1,8)];
img1 = (255*bases1(:)*bases1(:)');

% s = 1.5
[Pf2 Pr] = pot_ii(N, 1.5);
t = [(1+N/2):(I-N/2)];
Xp2 = X;
Xp2(t,:)=colxfm(Xp2(t,:), Pf2);
Xp2(:,t) = colxfm(Xp2(:,t)',Pf2)';

bases2 = [zeros(1,8); Pf2'; zeros(1,8)];
img2 = (255*bases2(:)*bases2(:)');

% s = 2
[Pf3 Pr] = pot_ii(N, 2);
t = [(1+N/2):(I-N/2)];
Xp3 = X;
Xp3(t,:)=colxfm(Xp3(t,:), Pf3);
Xp3(:,t) = colxfm(Xp3(:,t)',Pf3)';

bases3 = [zeros(1,8); Pf3'; zeros(1,8)];
img3 = (255*bases3(:)*bases3(:)');

%display all

figure(100);
draw(beside(img1, beside(img2, img3)));

figure(101);
draw(beside(0.5*Xp1, beside(0.5*Xp2, 0.5*Xp3)));
return