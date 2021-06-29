photo=imread('bottles_26.jpg');
bottle_gray = rgb2gray(photo);

bw = 1 - imbinarize(bottle_gray);

imshow(bw);

se = strel('square',2);
D = imerode(bw,se);

pound = bw;
% pound = bwselect(bw);
area = bwarea(pound);


%% Calculating size of bottle

contour = (pound-D);

x_max = 0;
x_min = size(contour,1);

y_max = 0;
y_min = size(contour,2);


for row = 1:size(contour,1)
    for col = 1:size(contour,2)
        if(contour(row,col) == 1)
            if(row > y_max)
                y_max = row;
                
            end
            if(row < y_min)
                y_min = row;
                
            end
            if(col > x_max)
                x_max = col;
            end
            if(col < x_min)
                x_min = col;
                
            end
        end
    end
end

line = contour;

line(y_min, x_min:x_max) = 1;
line(y_max, x_min:x_max) = 1;
line(y_min:y_max, x_min) = 1;
line(y_min:y_max, x_max) = 1;

out = [x_max-x_min, y_max-y_min];

subplot(2,2,1)
imshow(line);
subplot(2,2,2)
imshow(pound);

%% calculation

heightOfCoke = area/out(1);
procent = (heightOfCoke/out(2))*100;
