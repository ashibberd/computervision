%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_cone.tiff');
imageTwo=imread('right_cone.tiff');

windowSize=120;
varOverlap=0.1;

%%call function
[dpx,dpy] = compareOptimisedV2(imageOne,imageTwo,windowSize,varOverlap);

%%flat problems
%%maybe delete edge grids - could select a subset




