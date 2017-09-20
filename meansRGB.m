clear;
cd 'D:/dataset_denoising/';
addpath 'C:\Users\csjunxu\Documents\GitHub\Non-negativeSubspaceClustering';

%% picking out the images too dark or too bright
Original_image_dir = 'D:\dataset_denoising\Canon5D2_5_160_3200_chair';
fpath = fullfile(Original_image_dir, '*.JPG');
im_dir  = dir(fpath);
im_num = length(im_dir);
MeanIntensity = zeros(im_num, 1); % record mean intensity of each image
ImName = cell(im_num, 1); % record the name of each image
NumPoints = 500; % the number of points extracted from each dimension of each image
for i = 1:im_num
    fprintf(['Processing the image: ' im_dir(i).name '.\n']);
    Im = imread(fullfile(Original_image_dir, im_dir(i).name) ); % read image 
    ImYCbCr = rgb2ycbcr(Im); % transform from RGB to YCbCr space
    clear Im;
    ImY = ImYCbCr(:, :, 1); % only use the Y channel, illumination information
    [h, w, ch] = size(ImY); % the height and width of each image
    GridH = 1:floor(h/NumPoints):h; % record the position of points in height
    GridW = 1:floor(w/NumPoints):w; % record the position of points in width
    CropImY = ImY(GridH, GridW, ch); % extract the points, and form the cropped smaller image
    clear ImY;
    MeanIntensity(i) = mean(mean(CropImY)); % compute the mean intensity
    ImName{i, 1} = im_dir(i).name; % record the name of this image
end
%% sorting the images accordingto their mean intensities
[SortedMeanIntensity, Index] = sort(MeanIntensity, 'ascend'); 
fprintf(['The median and std of the intensities are ' num2str(median(SortedMeanIntensity)) ' and ' std(MeanIntensity) '.\n']);
fprintf(['The Corresponding Images are ' ImName{Index(1)} ' and ' ImName{Index(end)} '.\n']);

%% select the n*100 index 
nsample = length(Index);
n100 = floor(nsample/100);
centerindex = floor(nsample/2);
SelectIndex = Index(centerindex-n100*50+1:centerindex+n100*50);

%% mean of the selected sRGB images
D = regexp(Original_image_dir, '\', 'split');
sRGB = double(imread(fullfile(Original_image_dir, im_dir(1).name)));
sumsRGB = zeros(size(sRGB));
for i = 1:length(SelectIndex)
    %% read the sRGB image
    sRGB = double(imread(fullfile(Original_image_dir, im_dir(SelectIndex(i)).name)));
    S = regexp(im_dir(SelectIndex(i)).name, '\.', 'split');
    rawname = S{1};
    sumsRGB = sumsRGB + sRGB;
end
meanimage = uint8(sumsRGB./im_num);
imshow(meanimage);
imwrite(meanimage, [Original_image_dir 'mean/meansRGB.JPG']);
clear sRGB sumsRGB meansRGB;


