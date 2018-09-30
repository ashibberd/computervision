%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_portal.tiff');
imageTwo=imread('right_portal.tiff');

windowSize=300;

%%call function
[dpx,dpy] = compareColourImages(imageOne,imageTwo,windowSize);

