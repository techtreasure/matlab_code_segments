D = 'Folder\\1\\';
S = dir(fullfile(D,'*_mask_*.jpg')); 

for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    img = imread(F);
    BW = edge(im2bw(img));
    BW = bwmorph(BW,'remove');
    
    [filepath,name,ext] = fileparts(F);
    
    imwrite(BW,strcat(name,'_edge_',ext));
end
