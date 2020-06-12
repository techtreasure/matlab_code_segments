vid=VideoReader('house1.mp4');
n = vid.NumberOfFrames;

for iFrame = 1:n
  frames = read(vid, iFrame);
  imwrite(frames, fullfile(sprintf('%02d.png', iFrame)));
end 
