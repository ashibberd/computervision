%%read in images from file
%%for now use same image so we can get 0 dpx dpy
imageOne=imread('test_left_3.tiff');
imageTwo=imread('test_right_3.tiff');

windowSize=300;

%%call function
[dpx,dpy] = compareColourImages(imageOne,imageTwo,windowSize);

