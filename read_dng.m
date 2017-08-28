warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
%% poke at a sample DNG file using imfinfo.
info = imfinfo('DSC01352.dng');
info.SubIFDs{1};
%% http://www.mathworks.com/help/matlab/ref/tiff-class.html
t = Tiff('DSC01352.dng','r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));  
% TIFFReader might only be able to interpret official tiff tags, 
% and throws an error whenever it encounters private or custom tags.
cfa = read(t);
close(t);
imtool(cfa);