clc, clear all, close all

f = dir;
array = [49.77 66.30 73.27 73.48 73.48];

sortarray = sortrows(array);
sortarray = sortarray';
plot([0:1:4], sortarray,'--s','LineWidth',1.5,...
    'MarkerFaceColor','k',...
    'MarkerSize',3);
hold all;
axis([1:1:4]);
xlabel({'10^{-\gamma_{y}} '});
ylabel('PSNR(dB)');
grid on;



