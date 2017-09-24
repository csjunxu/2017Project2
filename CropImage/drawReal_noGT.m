clear;
TT_Original_image_dir = 'C:\Users\csjunxu\Desktop\CVPR2017\1_Results\Real_NoisyImage\';
TT_fpath = fullfile(TT_Original_image_dir, '*.png');
TT_im_dir  = dir(TT_fpath);
im_num = length(TT_im_dir);


for i = 5
    fprintf('%s: \n',TT_im_dir(i).name);
    S = regexp(TT_im_dir(i).name, '\.', 'split');
    im = S{1};
    h = 80;
    w = 120;
    s = 40;
    f = 5;
    lr = 2;
    
%     %% Noisy
%     image = imread(fullfile(TT_Original_image_dir, TT_im_dir(i).name));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_Noisy_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% BM3D Poisson
%     image = imread( sprintf('1_Results/Real_GATBM3D/BM3DPoisson_NC_algebraic_alpha1_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_BM3DPoisson_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% CBM3D
%     image = imread( sprintf('1_Results/Real_CBM3D/CBM3D_our14_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_CBM3D_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% WNNM
%     image = imread( sprintf('1_Results/Real_WNNM/WNNM_our14_lambda4_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_WNNM_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% MLP
%     image = imread(sprintf('1_Results/Real_MLP/MLP_Real_10_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_MLP_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% CSF
%     image = imread(sprintf('1_Results/Real_CSF/CSF_our_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_CSF_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% TRD
%     image = imread(sprintf('1_Results/Real_TRD/TRD_our14_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_TRD_%s.png',im);
%     imwrite(outputimage,imname,'png');
    
        %% DnCNN
    image = imread(sprintf('1_Results/Real_DnCNN/DnCNN_%s.png',im));
    [ outputimage ] = boxandresize( image, h,w,s, f,lr);
    imname = sprintf('br_DnCNN_%s.png',im);
    imwrite(outputimage,imname,'png');
    
%     %% NeatImage
%     image = imread( sprintf('1_Results/Real_NeatImage/NI_%s.jpg',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_NI_%s.png',im);
%     imwrite(outputimage,imname,'png');
%     
%     %% Noise Clinic
%     image = imread( sprintf('1_Results/Real_NoiseClinic/NC_Real_%s.png',im));
%     [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%     imname = sprintf('br_NC_%s.png',im);
%     imwrite(outputimage,imname,'png');
    
%     for para = [0.001 0.0006 0.0008 0.0009]
%         %% Guided
%         image = imread(sprintf(['1_Results/Real_Guided/Guided_RID_6x6x3x10_' im '_' num2str(para) '.png']));
%         [ outputimage ] = boxandresize( image, h,w,s, f,lr);
%         imname = sprintf(['br_Guided_RID_6x6x3x10_' im '_' num2str(para) '.png']);
%         imwrite(outputimage,imname,'png');
%     end
end




