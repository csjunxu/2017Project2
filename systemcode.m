system('del *TIFF2PNG.png');
system('del *.png');
system('dcraw -4 -T -D -v C:\Users\csjunxu\Desktop\Projects\RID_Dataset\checkparameters\DSC01613.ARW');
system('dcraw -w -v C:\Users\csjunxu\Desktop\Projects\RID_Dataset\checkparameters\DSC01613.ARW');