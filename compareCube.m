%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('left_box.tiff');
imageTwo=imread('right_box.tiff');

windowSize=300;

%%call function
[dpx,dpy] = compareColourImages(imageOne,imageTwo,windowSize);

