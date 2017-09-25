% given paired noisy and clean images with high resolutions, this function crops these
% images into smaller parts with paired regions
clear;
Original_image_dir = 'D:/meanimages/';
% Get a list of all files and folders in this folder.
files = dir(Original_image_dir);

GTpath = fullfile(Original_image_dir, '*mean.JPG');
GT_dir  = dir(GTpath);
GT_D = regexp(Original_image_dir, '/', 'split');

fpath = fullfile(Original_image_dir, '*Real.JPG');
nim_dir  = dir(fpath);
nim_num = length(nim_dir);
nim_D = regexp(Original_image_dir, '/', 'split');

nsample = 10;
herror = 0;
werror = 0;
% Canon5D2_5_160_3200_plug£º herror = 0; werror = 0;

% set the image size to 512x512
height = 512;
width = 512;
for i = 6 %1:nim_num
    I =  im2double( imread(fullfile(Original_image_dir, GT_dir(i).name)) );
    nI =  im2double( imread(fullfile(Original_image_dir, nim_dir(i).name)) );
    % S = regexp(GT_dir(i).name, '_', 'split');
    % fprintf('The image is %s.\n', S{1});
    [h, w, ch]=size(nI);
    for sample = 1:nsample
%         rand('seed', 0)
        %% 1. randomly generate position index
        hi = randi( h - height + 1 );
%         rand('seed', 0)
        wi = randi( [min(w/4, w - width + 1), 3/4 * w] );
        %% 2. crop paired images
        cropI = I( hi : hi + height - 1, wi : wi + width - 1, : );
        cropnI = nI( hi+herror : hi+herror + height - 1, wi+werror : wi+werror + width - 1, : );
        fprintf('The PSNR = %2.4f, SSIM = %2.4f\n', csnr( cropnI*255, cropI*255, 0, 0 ), cal_ssim( cropnI*255, cropI*255, 0, 0 ));
        
        % imshow(cropnI);
        %% 3. write images
        write_dir = 'C:/Users/csjunxu/Desktop/RID_Dataset/RealisticImage/';
        if ~isdir(write_dir)
            mkdir(write_dir);
        end
        meanname = sprintf([write_dir GT_dir(i).name(1:end-8) num2str(sample) '_mean.JPG']);
        imwrite(cropI, meanname);
        nimname = sprintf([write_dir nim_dir(i).name(1:end-8) num2str(sample) '_real.JPG']);
        imwrite(cropnI, nimname);
    end
end