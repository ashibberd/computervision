%%read in images from file
%%for now use same image so we can get 0 dpx dpy
left_portal_colour=imread('left_portal.tiff');
right_portal_colour=imread('right_portal.tiff');

%%convert RGB to grayscale
left_portal_grayscale=rgb2gray(left_portal_colour);
right_portal_grayscale=rgb2gray(right_portal_colour);

%%convert to double precision
left_portal_grayscale=im2double(left_portal_grayscale);
right_portal_grayscale=im2double(right_portal_grayscale);

%%set parameters
%%note template will be +1 on window size (middle section)
windowSize=120;
fWindow=.5;

%%set mesh - create call function
x_min=200;
x_max=1600;
x_res=200;
y_min=200;
y_max=800;
y_res=200;
x = x_min:x_res:x_max;
y = y_min:y_res:y_max;
[xGrid,yGrid] = meshgrid(x,y);

%%show grids
figure()
imshow(left_portal_grayscale)
hold on
plot(xGrid,yGrid,'*','MarkerSize',20)


[dpx,dpy] = compareImages(left_portal_grayscale,right_portal_grayscale,windowSize,xGrid,yGrid,fWindow);

%%show grids
figure()
imshow(right_portal_grayscale)
hold on
plot(xGrid+dpx,yGrid+dpy,'*','MarkerSize',20)

