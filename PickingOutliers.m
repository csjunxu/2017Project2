clear;
Original_image_dir = 'D:\dataset_denoising\Canon5D2_5_160_3200_chair\';
fpath = fullfile(Original_image_dir, '*.JPG');
im_dir  = dir(fpath);
im_num = length(im_dir);


MeanIntensity = zeros(im_num, 1); % record mean intensity of each image
ImName = cell(im_num, 1); % record the name of each image
NumPoints = 500; % the number of points extracted from each dimension of each image
for i = 1:im_num
    Im = imread(fullfile(Original_image_dir, im_dir(i).name) ); % read image 
    ImYCbCr = rgb2ycbcr(Im); % transform from RGB to YCbCr space
    ImY = ImYCbCr(:, :, 1); % only use the Y channel, illumination information
    [h, w, ch] = size(ImY); % the height and width of each image
    GridH = 1:floor(h/NumPoints):h; % record the position of points in height
    GridW = 1:floor(w/NumPoints):w;% record the position of points in width
    CropImY = ImY(GridH, GridW, ch); % extract the points, and form the cropped smaller image
    MeanIntensity(i) = mean(mean(CropImY)); % compute the mean intensity
    ImName{i, 1} = im_dir(i).name; % record the name of this image
end
%% sorting the images accordingto their mean intensities
[SortedMeanIntensity, Index] = sort(MeanIntensity, 'ascend'); 
fprintf(['The Highest and Lowest Mean Intensities are ' num2str(SortedMeanIntensity(1)) ' and ' num2str(SortedMeanIntensity(end)) '.\n']);
fprintf(['The Corresponding Images are ' ImName{Index(1)} ' and ' ImName{Index(end)} '.\n']);


