%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_tuscany.tiff');
imageTwo=imread('right_tuscany.tiff');

windowSize=120;
varOverlap=0.5;

%%call function
[dpx,dpy] = compareOptimised(imageOne,imageTwo,windowSize,varOverlap);

