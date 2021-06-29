photo=imread('text.bmp');
grey = rgb2gray(photo);

% on threshold higher than 0.9 it apper unwanted text
bw = imbinarize(grey, 0.9);


se = strel('square',2);
D = imerode(bw,se);
subplot(2,2,1)
imshow(photo)
title('Orginal');
subplot(2,,2)
imshow(D);
title('After binarization and erosion');