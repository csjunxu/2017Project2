clear;
Original_image_dir = 'C:\Users\csjunxu\Desktop\TIP2017\RID_Dataset\DatasetTIP\Canon_80D_ISO800\';
fpath = fullfile(Original_image_dir, '*.JPG');
im_dir  = dir(fpath);
im_num = length(im_dir);

MeanIntensity = zeros(im_num, 1);
ImName = cell(im_num, 1);
NumPoints = 100;
for i = 1:im_num
    Im = imread(fullfile(Original_image_dir, im_dir(i).name) );
    ImYCbCr = rgb2ycbcr(Im);
    ImY = ImYCbCr(:, :, 1);
    [h, w, ch] = size(ImY);
    GridH = 1:floor(h/NumPoints):h;
    GridW = 1:floor(w/NumPoints):w;
    CropImY = imY(GridH, GridW, ch);
    MeanIntensity(i) = mean(mean(CropImY));
    ImName{i} = im_dir(i).name;
end
%% sorting the images accordingto their mean intensities
[Index, SortedMeanIntensity] = sort(MeanIntensity, 'descending');
ImName = ImName{Index};
fprint(['The Highest and Lowest Mean Intensities are' SortedMeanIntensity(1) ' and ' SortedMeanIntensity(end)]);
fprint(['The Corresponding Images are ' ImName{1} ' and ' ImName{end}]);