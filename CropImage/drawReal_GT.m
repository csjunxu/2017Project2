clear;
% GT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\cc_Results\Real_ccnoise_denoised_part\';
% GT_fpath = fullfile(GT_Original_image_dir, '*mean.png');
% TT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\cc_Results\Real_ccnoise_denoised_part\';
% TT_fpath = fullfile(TT_Original_image_dir, '*real.png');
% GT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\cc_Results\Real_MeanImage\';
% GT_fpath = fullfile(GT_Original_image_dir, '*.png');
% TT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\cc_Results\Real_NoisyImage\';
% TT_fpath = fullfile(TT_Original_image_dir, '*.png');
GT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\our_Results\Real_MeanImage\';
GT_fpath = fullfile(GT_Original_image_dir, '*.JPG');
TT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\our_Results\Real_NoisyImage\';
TT_fpath = fullfile(TT_Original_image_dir, '*.JPG');

% GT_Original_image_dir = './';
% GT_fpath = fullfile(GT_Original_image_dir, 'clean.png');
% TT_Original_image_dir = './';
% TT_fpath = fullfile(TT_Original_image_dir, 'noisy.png');

GT_im_dir  = dir(GT_fpath);
TT_im_dir  = dir(TT_fpath);
im_num = length(TT_im_dir);

guideddir = 'Real_Guided';
% Real_Guided_EI_II_faster
% Real_Guided

for i = 90
    
    fprintf('%s: \n',TT_im_dir(i).name);
    S = regexp(TT_im_dir(i).name, '\.', 'split');
    im = S{1};
    h = 400;
    w = 1;
    s = 40;
    f = 6;
    lr = 1;
    %% GT
    image = imread(fullfile(GT_Original_image_dir, GT_im_dir(i).name));
    [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    imname = sprintf('br_Mean_%s.png',im);
    imwrite(outputimage,imname,'png');
    IM_GT = im2double(imread(fullfile(GT_Original_image_dir, GT_im_dir(i).name)));
    
    %     %% Noisy
    %     image = imread(fullfile(TT_Original_image_dir, TT_im_dir(i).name));
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_Noisy_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     image = im2double(imread(fullfile(TT_Original_image_dir, TT_im_dir(i).name)));
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('Noisy: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     %% CBM3D
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/Real_CBM3D/CBM3D_CC%d_%s.png', im_num, im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/Real_CBM3D/CBM3D_CC%d_%s.png', im_num, im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/Real_CBM3D/CBM3D_our%d_%s.png', im_num, im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_CBM3D_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread( sprintf('cc_Results/Real_CBM3D/CBM3D_CC%d_%s.png', im_num, im)));
    %     elseif im_num==60
    %         image = im2double(imread( sprintf('cc_Results/Real_CBM3D/CBM3D_CC%d_%s.png', im_num, im)));
    %     elseif im_num==100
    %         image = im2double(imread( sprintf('our_Results/Real_CBM3D/CBM3D_our%d_%s.png', im_num, im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('CBM3D: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     %% WNNM
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/Real_WNNM/WNNMcw_CC%d_lambda4_%s.png', im_num, im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/Real_WNNM/WNNMcw_CC%d_lambda4_%s.png', im_num, im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/Real_WNNM/WNNMcw_our%d_lambda4_%s.JPG', im_num, im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_WNNM_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread( sprintf('cc_Results/Real_WNNM/WNNMcw_CC%d_lambda4_%s.png', im_num, im)));
    %     elseif im_num==60
    %         image = im2double(imread( sprintf('cc_Results/Real_WNNM/WNNMcw_CC%d_lambda4_%s.png', im_num, im)));
    %     elseif im_num==100
    %         image = im2double(imread(sprintf('our_Results/Real_WNNM/WNNMcw_our%d_lambda4_%s.JPG', im_num, im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('WNNM: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    
    %     %% MLP
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/Real_MLP/MLP_CC%d_%s.png', im_num, im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/Real_MLP/MLP_CC%s.png', im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/Real_MLP/MLP_our%d_%s.png', im_num , im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_MLP_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread(sprintf('cc_Results/Real_MLP/MLP_CC%d_%s.png', im_num, im)));
    %     elseif im_num==60
    %         image = im2double(imread(sprintf('cc_Results/Real_MLP/MLP_CC%d_%s.png', im_num, im)));
    %     elseif im_num==100
    %         image = im2double(imread(sprintf('our_Results/Real_MLP/MLP_our%d_%s.png', im_num , im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('MLP: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    
    %     %% CSF
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/Real_CSF/CSF_CC%d_%s.png', im_num, im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/Real_CSF/CSF_%s.png', im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/Real_CSF/CSF_our_%s.png' , im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_CSF_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread(sprintf('cc_Results/Real_CSF/CSF_%s.png',im)));
    %     elseif im_num==60
    %         image = im2double(imread(sprintf('cc_Results/Real_CSF/CSF_%s.png',im)));
    %     elseif im_num==100
    %         image = im2double(imread(sprintf('our_Results/Real_CSF/CSF_our_%s.png' , im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('CSF: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     %% TRD
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/Real_TRD/TRD_CC%d_%s.png', im_num, im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/Real_TRD/TRD_%s.png', im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/Real_TRD/TRD_our%d_%s.png', im_num , im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_TRD_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread(sprintf('cc_Results/Real_TRD/TRD_CC%d_%s.png', im_num, im)));
    %     elseif im_num==60
    %         image = im2double(imread(sprintf('cc_Results/Real_TRD/TRD_%s.png', im)));
    %     elseif im_num==100
    %         image = im2double(imread(sprintf('our_Results/Real_TRD/TRD_our%d_%s.png', im_num , im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('TRD: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    
    %% DnCNN
    if im_num==15
        image = imread(sprintf('cc_Results/Real_DnCNN/DnCNN_CC%d_%s.%s', im_num, im, S{end}));
    elseif im_num==60
        image = imread(sprintf('cc_Results/Real_DnCNN/DnCNN_CC%d_%s.%s', im_num, im, S{end}));
    elseif im_num==100
        image = imread(sprintf('our_Results/Real_DnCNN/DnCNN_our%d_%s.%s', im_num, im, S{end}));
    end
    [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    imname = sprintf('br_DnCNN_%s.png', im);
    imwrite(outputimage,imname,'png');
    if im_num==15
        image = im2double(imread(sprintf('cc_Results/Real_DnCNN/DnCNN_CC%d_%s.%s', im_num, im, S{end})));
    elseif im_num==60
        image = im2double(imread(sprintf('cc_Results/Real_DnCNN/DnCNN_CC%d_%s.%s', im_num, im, S{end})));
    elseif im_num==100
        image = im2double(imread(sprintf('our_Results/Real_DnCNN/DnCNN_our%d_%s.%s', im_num, im, S{end})));
    end
    PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    fprintf('DnCNN: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    
    %     %% NeatImage
    %     if im_num==15
    %         image = imread( sprintf('cc_Results/Real_NeatImage/NI_%s.jpg',im));
    %     elseif im_num==60
    %         image = imread( sprintf('cc_Results/Real_NeatImage/NI_%s.png',im));
    %     elseif im_num==100
    %         image = imread( sprintf('our_Results/Real_NeatImage/NI_%s.jpg',im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_NI_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread( sprintf('cc_Results/Real_NeatImage/NI_%s.jpg',im)));
    %     elseif im_num==60
    %         image = im2double(imread( sprintf('cc_Results/Real_NeatImage/NI_%s.png',im)));
    %     elseif im_num==100
    %         image = im2double(imread( sprintf('our_Results/Real_NeatImage/NI_%s.jpg',im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('NI: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     % Noise clinic
    %     if im_num==15
    %         image = imread( sprintf('cc_Results/Real_NoiseClinic/NC_%s.png',im));
    %     elseif im_num==60
    %         image = imread( sprintf('cc_Results/Real_NoiseClinic/NC_%s.png',im));
    %     elseif im_num==100
    %         image = imread( sprintf('our_Results/Real_NoiseClinic/NC_%s.png',im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_NC_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread( sprintf('cc_Results/Real_NoiseClinic/NC_%s.png',im)));
    %     elseif im_num==60
    %         image = im2double(imread( sprintf('cc_Results/Real_NoiseClinic/NC_%s.png',im)));
    %     elseif im_num==100
    %         image = im2double(imread( sprintf('our_Results/Real_NoiseClinic/NC_%s.png',im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('NC: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     if im_num==15
    %         %% CCNoise
    %         S = regexp(TT_im_dir(i).name, '_', 'split');
    %         im = S{1};
    %         for ii = 2:length(S)-1
    %             im = [im '_' S{ii}];
    %         end
    %         image = imread(sprintf('cc_Results/Real_ccnoise_denoised_part/%s_ours.png',im));
    %         [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %         imname = sprintf('br_CCNoise_%s.png',im);
    %         imwrite(outputimage,imname,'png');
    %         image = im2double(imread(sprintf('cc_Results/Real_ccnoise_denoised_part/%s_ours.png',im)));
    %         PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %         SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %         fprintf('CCNoise: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %     end
    %
    %     %     %     Offline
    %     %     image = imread(sprintf('cc_Results/Real_Offline/Offline_RGB_BID_%s.png',im));
    %     %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     %     imname = sprintf('br_Offline_%s.png',im);
    %     %     imwrite(outputimage,imname,'png');
    %     %     image = im2double(imread(sprintf('cc_Results/Real_Offline/Offline_RGB_BID_%s.png',im)));
    %     %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     %     fprintf('Offline: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %     %
    %     %     %     Online
    %     %     image = imread(sprintf('cc_Results/Real_Online/Online_RGB_BID_%s.png',im));
    %     %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     %     imname = sprintf('br_Online_%s.png',im);
    %     %     imwrite(outputimage,imname,'png');
    %     %     image = im2double(imread(sprintf('cc_Results/Real_Online/Online_RGB_BID_%s.png',im)));
    %     %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     %     fprintf('Online: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
    %
    %     %     Guided
    %     if im_num==15
    %         image = imread(sprintf('cc_Results/%s/Guided_%s_real.png',guideddir,im));
    %     elseif im_num==60
    %         image = imread(sprintf('cc_Results/%s/Guided_%s.png',guideddir,im));
    %     elseif im_num==100
    %         image = imread(sprintf('our_Results/%s/Guided_EI_II_%s.png',guideddir,im));
    %     end
    %     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    %     imname = sprintf('br_Guided_%s.png',im);
    %     imwrite(outputimage,imname,'png');
    %     if im_num==15
    %         image = im2double(imread(sprintf('cc_Results/%s/Guided_%s_real.png',guideddir,im)));
    %     elseif im_num==60
    %         image = im2double(imread(sprintf('cc_Results/%s/Guided_%s.png',guideddir,im)));
    %     elseif im_num==100
    %         image = im2double(imread(sprintf('our_Results/%s/Guided_EI_II_%s.png',guideddir,im)));
    %     end
    %     PSNR = csnr( image*255, IM_GT*255, 0, 0 );
    %     SSIM = cal_ssim( image*255, IM_GT*255, 0, 0 );
    %     fprintf('Guided: PSNR/SSIM = (%2.2fdB/%2.4f) \n', PSNR, SSIM);
end

