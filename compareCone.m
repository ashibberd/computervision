%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_cone.tiff');
imageTwo=imread('right_cone.tiff');

windowSize=200;

%%call function
[dpx,dpy] = compareColourImages(imageOne,imageTwo,windowSize);

%%something to make it continue if inputs are flat

