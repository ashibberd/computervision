%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_tuscany.tiff');
imageTwo=imread('right_tuscany.tiff');

windowSize=150;
varOverlap=0.05;

%%call function
[dpx,dpy] = compareOptimisedV2(imageOne,imageTwo,windowSize,varOverlap);

