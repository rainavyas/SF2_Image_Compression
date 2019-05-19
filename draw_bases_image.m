function draw_bases_image()

C8 = dct_ii(8);
bases = [zeros(1,8); C8'; zeros(1,8)];
draw(255*bases(:)*bases(:)');