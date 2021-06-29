can=imread('opened_10.bmp');
bw = imbinarize(can, 0.2);


count1 = 0;
count2 = 0;
count3 = 0;
m1 = [0 0; 0 1];
m2 = [0 1; 1 1];
m3 = [1 0; 0 1];

for i = 1:(size(bw,1)-1)
    for j = 1:(size(bw,2)-1)
        if (isequal(bw(i:(i+1), j:(j+1)), m1))
            count1 = count1 + 1;
        end
        if (isequal(bw(i:(i+1), j:(j+1)), m2))
            count2 = count2 + 1;
        end
        if (isequal(bw(i:(i+1), j:(j+1)), m3))
            count3 = count3 + 1;
        end
    end
end
euler =abs(count1 - count2 + count3);

imshow(bw);