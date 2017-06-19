clear;
addpath('Data');
addpath('Utilities');
Original_image_dir = 'C:\Users\csjunxu\Desktop\TIP2017\RID_Dataset\DatasetTIP\Canon_80D_ISO800\';
fpath = fullfile(Original_image_dir, '*.JPG');
im_dir  = dir(fpath);
im_num = length(im_dir);

MeanIntensity = zeros(im_num, 1);
NumPoints = 100;
for i = 1:im_num
    Im = imread(fullfile(Original_image_dir, im_dir(i).name) );
    ImYCbCr = rgb2ycbcr(Im);
    ImY = ImYCbCr(:, :, 1);
    [h, w, ch] = size(ImY);
    GridH = 1:floor(h/NumPoints):h;
    GridW = 1:floor(w/NumPoints):w;
    
end