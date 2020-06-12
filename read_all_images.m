dinfo = dir('*.jpg');
for K = 1 : length(dinfo)
    
    i = dinfo(K).name;
    
    RGB = imread(i);

    imageStd = imresize(RGB,[224,224]);
    [filepath,name,ext] = fileparts(i);
    
    imwrite(imageStd,strcat(name,'.jpg'));
end
