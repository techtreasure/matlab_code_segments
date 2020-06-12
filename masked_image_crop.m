s = imread('image.png');
BW = im2bw(s,0.2);

[w, h] = size(BW);

c = 1;

for i=1:w
    for j=1:h
        if BW(i,j)>0
            ai(c) = i;
            aj(c) = j;
            c = c + 1;
        end        
    end
end

J = imcrop(s,[min(aj) min(ai) max(aj)-min(aj) max(ai)-min(ai)]);
figure,imshow(s);
figure,imshow(J);
