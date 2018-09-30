%%read in images from file
%%for now use same image so we can get 0 dpx dpy
left_cone_colour=imread('left_cone.tiff');
right_cone_colour=imread('right_cone.tiff');

%%convert RGB to grayscale
left_cone_grayscale=rgb2gray(left_cone_colour);
right_cone_grayscale=rgb2gray(right_cone_colour);

%%convert to double precision
left_cone_grayscale=im2double(left_cone_grayscale);
right_cone_grayscale=im2double(right_cone_grayscale);

%%set parameters
%%note template will be +1 on window size (middle section)
windowSize=100;
fWindow=0.3;

%%set mesh - create call function
x_min=200;
x_max=400;
x_res=100;
y_min=200;
y_max=600;
y_res=100;
x = x_min:x_res:x_max;
y = y_min:y_res:y_max;
[xGrid,yGrid] = meshgrid(x,y);

%%show grids
figure()
imshow(left_cone_grayscale)
hold on
plot(xGrid,yGrid,'*','MarkerSize',20)


[dpx,dpy] = compareImages(left_cone_grayscale,right_cone_grayscale,windowSize,xGrid,yGrid,fWindow);

%%show grids
figure()
imshow(right_cone_grayscale)
hold on
plot(xGrid+dpx,yGrid+dpy,'*','MarkerSize',20)

