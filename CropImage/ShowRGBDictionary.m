% figure('Name','д╛хо');
% subplot(2,2,1);
% subplot(2,2,2);
% subplot(2,2,3);
% subplot(2,2,4);
% 
% figure('Name','╫Т╢у');
% subplot('Position',[0.02 0.65 0.3 0.3]);
% subplot('Position',[0.35 0.65 0.3 0.3]);
% subplot('Position',[0.02 0.3 0.3 0.3]);
% subplot('Position',[0.35 0.3 0.3 0.3]);

clear,clc
load 'PGGMM_RGB_6x6_3_win15_nlsp10_delta0.002_cls33.mat';
[~, index] = sort(model.mixweights,'descend');
i = 13;
ch = 3;
hold on;
% subplot('Position',[0 0.5 0 0.5]);
displayDictionaryElementsAsImage(GMM.D{index(i)}, 12, 9, ps, ps, ch);
% subplot('Position',[0 0.5 0.5 0.5]);
plot(GMM.S{index(i)});
% subplot('Position',[0.5 1 0.4 0.4]);
% displayDictionaryElementsAsImage(reshape(GD(:,28),[ps^2 ps^2]), ps, ps, ps, ps);
% subplot('Position',[0 0.4 0.3 0.3]);
% displayDictionaryElementsAsImage(reshape(GD(:,31),[ps^2 ps^2]), ps, ps, ps, ps);
% subplot('Position',[0.5 0.1 0.3 0.3]);


% subplot('Position',[0 0.1 0.3 0.3]);
% displayDictionaryElementsAsImage(reshape(GD(:,37),[ps^2 ps^2]), ps, ps, ps, ps);
% subplot('Position',[0.5 0.1 0.3 0.3]);
% plot(GS(:,37));


% displays the dictionary atoms as blocks. For activation, the dictionary D
% should be given, as also the number of rows (numRows) and columns
% (numCols) for the atoms to be displayed. X and Y are the dimensions of
% each atom.