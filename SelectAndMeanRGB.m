clear;
% cd 'D:/dataset_denoising/';
cd 'D:/selectedmeanimages/';
addpath 'C:\Users\csjunxu\Documents\GitHub\2017Project2';
d = dir;
cd 'C:\Users\csjunxu\Documents\GitHub\2017Project2';

fileID = fopen('record.txt','w');
for j = 1:length(d)
    if ( ~strcmp(d(j).name,'.') && ~strcmp(d(j).name,'..') ) % (d(j).isdir == 1) &&
        %% picking out the images too dark or too bright
        fprintf(['Processing the image: ' d(j).name '.\n']);
        d(j).name = d(j).name(1:end-9);
        fprintf(fileID, [d(j).name ':\n']);
        Original_image_dir = ['D:\dataset_denoising\' d(j).name];
        fpath = fullfile(Original_image_dir, '*.JPG');
        im_dir  = dir(fpath);
        im_num = length(im_dir);
        MeanIntensity = zeros(im_num, 1); % record mean intensity of each image
        ImName = cell(im_num, 1); % record the name of each image
        NumPoints = 500; % the number of points extracted from each dimension of each image
        for i = 1:im_num
            fprintf(['Processing the ' num2str(i) 'th image: ' im_dir(i).name '.\n']);
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
        fprintf(['The median intensity is ' num2str(median(SortedMeanIntensity)) ' in ' im_dir(Index(floor((1+length(Index))/2))).name '.\n']);
        fprintf(['The lowest intensity is ' num2str(SortedMeanIntensity(1)) ' in ' im_dir(Index(1)).name '.\n']);
        fprintf(['The highest intensity is ' num2str(SortedMeanIntensity(end)) ' in ' im_dir(Index(end)).name '.\n']);
        fprintf(fileID, ['The median intensity is ' num2str(median(SortedMeanIntensity)) ' in ' im_dir(Index(floor((1+length(Index))/2))).name '.\n']);
        fprintf(fileID, ['The lowest intensity is ' num2str(SortedMeanIntensity(1)) ' in ' im_dir(Index(1)).name '.\n']);
        fprintf(fileID, ['The highest intensity is ' num2str(SortedMeanIntensity(end)) ' in ' im_dir(Index(end)).name '.\n']);
        %% select the n*100 index
        nsample = length(Index);
        n100 = min(floor(nsample/100), 5); % select at most 500 images
        centerindex = floor(nsample/2);
        SelectIndex = Index(centerindex-n100*50+1:centerindex+n100*50);
        %% mean of the selected sRGB images
        D = regexp(Original_image_dir, '\', 'split');
        write_results_dir = [D{1} '/meanimages/'];
        if ~isdir(write_results_dir)
            mkdir(write_results_dir);
        end
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
        imwrite(meanimage, [write_results_dir '/' D{end} '_mean.JPG']);
        clear sRGB sumsRGB meansRGB;
    end
end
fclose(fileID);
