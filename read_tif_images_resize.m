dinfo = dir('*.tif');
for K = 1 : length(dinfo)
    
    i = dinfo(K).name;  %just the name
    
    [X MAP] = imread(i);

    % Convert indexed image to true-color (RGB) format
    RGB = ind2rgb(X,MAP); 

    % Convert image to L*a*b* color space
    cform2lab = makecform('srgb2lab');
    LAB = applycform(RGB, cform2lab); 

    % Scale values to range from 0 to 1
    L = LAB(:,:,1)/100; 

    % Perform CLAHE
    LAB(:,:,1) = adapthisteq(L,'NumTiles',...
                             [8 8],'ClipLimit',0.005)*100;

    % Convert back to RGB color space
    cform2srgb = makecform('lab2srgb');
    J = applycform(LAB, cform2srgb);
    
    
    [y,x] = size(J);
    
    croped = imcrop(J,[60 0 x-60 y-80]);

    img = padarray(croped, [150, 0]);
    imageStd = imresize(img,[512,512]);
    [filepath,name,ext] = fileparts(i)
    
    imwrite(imageStd,strcat(name,'.png'));
end
