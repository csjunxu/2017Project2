clear;
%% mean of raw images 
Original_image_dir = '20170121/Canon_80D_ISO12800';
fpath = fullfile(Original_image_dir, '*.tiff');
im_dir  = dir(fpath);
im_num = length(im_dir);
Raw = double(imread(fullfile(Original_image_dir, im_dir(1).name)));
meanRawAll = zeros(size(Raw));
meanRaw500 = zeros(size(Raw));
for i = 1:im_num
    %% read the tiff image
    Raw = double(imread(fullfile(Original_image_dir, im_dir(i).name)));
    S = regexp(im_dir(i).name, '\.', 'split');
    rawname = S{1};
    %     fprintf('Processing %s. \n', rawname);
    meanRawAll = meanRawAll + Raw;
    if i == min(500,im_num)
        meanRaw500 = uint16(meanRawAll./min(500,im_num));
%         imshow(meanRaw500);
        imwrite(meanRaw500, [Original_image_dir 'mean/meanRaw500_ARW2TIF.tiff']);
        clear meanRaw500;
    end
end
meanRawAll = uint16(meanRawAll./im_num);
% imshow(meansRGBAll);
imwrite(meanRawAll,[Original_image_dir 'mean/meanRawAll_ARW2TIF.tiff']);
clear Raw meanRawAll;