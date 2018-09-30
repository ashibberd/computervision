%%read in images from file
%%for now use same image so we can get 0 dpx dpy
left_box_colour=imread('left_box.tiff');
right_box_colour=imread('right_box.tiff');

%%convert RGB to grayscale
left_box_grayscale=rgb2gray(left_box_colour);
right_box_grayscale=rgb2gray(right_box_colour);

%%convert to double precision
left_box_grayscale=im2double(left_box_grayscale);
right_box_grayscale=im2double(right_box_grayscale);

%%set parameters
%%note template will be +1 on window size (middle section)
windowSize=100;
fWindow=1;

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
imshow(left_box_grayscale)
hold on
plot(xGrid,yGrid,'*','MarkerSize',20)


[dpx,dpy] = compareImages(left_box_grayscale,right_box_grayscale,windowSize,xGrid,yGrid,fWindow);

%%show grids
figure()
imshow(right_box_grayscale)
hold on
plot(xGrid+dpx,yGrid+dpy,'*','MarkerSize',20)

