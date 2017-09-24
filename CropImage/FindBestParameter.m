X1 = 1e-3:1e-4:4e-3;
Y1 = [];
Y2 = [];
for param = 0.0010:0.0001:0.0040
    result = sprintf('Guided_RGB_RID_%.4f.mat',param);
    eval(['load ' num2str(result)]);
    Y1 = [Y1 mPSNR(end)];
    Y2 = [Y2 mSSIM(end)];
end
createfigure(X1, Y1, Y2);