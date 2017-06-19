clear;
Original_image_dir = 'C:\Users\csjunxu\Desktop\TIP2017\RID_Dataset\DatasetTIP\Canon_80D_ISO800\';
fpath = fullfile(Original_image_dir, '*.JPG');
im_dir  = dir(fpath);
im_num = length(im_dir);


MeanIntensity = zeros(im_num, 1); % record mean intensity of each image
ImName = cell(im_num, 1); % record the name of each image
NumPoints = 100; % the number of points extracted from each dimension of each image
for i = 1:im_num
    Im = imread(fullfile(Original_image_dir, im_dir(i).name) ); % read image 
    ImYCbCr = rgb2ycbcr(Im); % transform from RGB to YCbCr space
    ImY = ImYCbCr(:, :, 1); % only use the Y channel, illumination information
    [h, w, ch] = size(ImY); % the height and width of each image
    GridH = 1:floor(h/NumPoints):h; % record the position of points in height
    GridW = 1:floor(w/NumPoints):w;% record the position of points in width
    CropImY = imY(GridH, GridW, ch); % extract the points, and form the cropped smaller image
    MeanIntensity(i) = mean(mean(CropImY)); % compute the mean intensity
    ImName{i} = im_dir(i).name; % record the name of this image
end
%% sorting the images accordingto their mean intensities
[Index, SortedMeanIntensity] = sort(MeanIntensity, 'descending'); 
ImName = ImName{Index};
fprint(['The Highest and Lowest Mean Intensities are' SortedMeanIntensity(1) ' and ' SortedMeanIntensity(end)]);
fprint(['The Corresponding Images are ' ImName{1} ' and ' ImName{end}]);