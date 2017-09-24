% given paired noisy and clean images with high resolutions, this function crops these
% images into smaller parts with paired regions
clear;
Original_image_dir = 'D:/meanimages/';
% Get a list of all files and folders in this folder.
files = dir(Original_image_dir);

GTpath = fullfile(Original_image_dir, '*mean.JPG');
GT_dir  = dir(GTpath);
I =  im2double( imread(fullfile(Original_image_dir, GT_dir(1).name)) );
GT_D = regexp(Original_image_dir, '/', 'split');

fpath = fullfile(Original_image_dir, '*Real.JPG');
nim_dir  = dir(fpath);
nim_num = length(nim_dir);
nim_D = regexp(Original_image_dir, '/', 'split');

% set the image size to 512x512
height = 512;
width = 512;
list = randi(nim_num, [1 10]);
for i = 1:length(list)
    nI =  im2double( imread(fullfile(sRGB_dir, nim_dir(list(i)).name)) );
    S = regexp(nim_dir(list(i)).name, '\.', 'split');
    fprintf('The image is %s.\n', S{1});
    [h, w, ch]=size(nI);
    %% 1. randomly generate position index
    hi = randi( h - height + 1 );
    wi = randi( [min(w/4, w - width + 1), 3/4 * w] );
    %% 2. crop paired images
    cropI = I( hi : hi + height - 1, wi : wi + width - 1, : );
    cropnI = nI( hi : hi + height - 1, wi : wi + width - 1, : );
    fprintf('The PSNR = %2.4f, SSIM = %2.4f\n', csnr( cropnI*255, cropI*255, 0, 0 ), cal_ssim( cropnI*255, cropI*255, 0, 0 ));
    
    imshow(cropnI);
    %% 3. write images
    write_mean_dir = 'C:/Users/csjunxu/Desktop/CVPR2017/our_Results/Real_MeanImage/';
    write_sRGB_dir = 'C:/Users/csjunxu/Desktop/CVPR2017/our_Results/Real_NoisyImage/';
    if ~isdir(write_mean_dir)
        mkdir(write_mean_dir)
    end
    if ~isdir(write_sRGB_dir)
        mkdir(write_sRGB_dir)
    end
    nimname = sprintf([write_sRGB_dir subdir(k).name '_' S{1} '_part' num2str(i) '.JPG']);
    imwrite(cropnI, nimname);
    meanname = sprintf([write_mean_dir subdir(k).name '_mean_' S{1} '_part' num2str(i) '.JPG']);
    imwrite(cropI, meanname);
    %     gI = cropI + 10/255*randn(size(cropI));
    %     gtname = sprintf('G%s_part_%d.png', S{1}, i);
    %     imwrite(gI,gtname);
end