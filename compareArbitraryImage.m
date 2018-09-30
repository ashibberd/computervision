%%read in images from file
%%for now use same image so we can get 0 dpx dpy
left_tuscany_colour=imread('left_tuscany.tiff');
right_tuscany_colour=imread('right_tuscany.tiff');

%%convert RGB to grayscale
left_tuscany_grayscale=rgb2gray(left_tuscany_colour);
right_tuscany_grayscale=rgb2gray(right_tuscany_colour);

%%convert to double precision
left_tuscany_grayscale=im2double(left_tuscany_grayscale);
right_tuscany_grayscale=im2double(right_tuscany_grayscale);
right_tuscany_grayscale_save=im2double(right_tuscany_grayscale);

%%set parameters
%%note template will be +1 on window size (middle section)
windowSize=100;
fWindow=1;

%%set mesh - create call function
[xGrid,yGrid,xPad,yPad] = generateMesh(windowSize,left_tuscany_grayscale);

%%pad first image
left_tuscany_grayscale=padarray(left_tuscany_grayscale,[yPad+1,xPad+1],'post');

%%pad second image
right_tuscany_grayscale=padarray(right_tuscany_grayscale,[yPad+1,xPad+1],'post');
right_tuscany_grayscale=padarray(right_tuscany_grayscale,[windowSize,windowSize],'post');
right_tuscany_grayscale=padarray(right_tuscany_grayscale,[windowSize,windowSize],'pre');

%%show grids
figure()
imshow(left_tuscany_grayscale)
hold on
plot(xGrid,yGrid,'*','MarkerSize',20)

[dpx,dpy] = compareImages(left_tuscany_grayscale,right_tuscany_grayscale,windowSize,xGrid,yGrid,fWindow);

%%show grids
figure()
imshow(right_tuscany_grayscale_save)
hold on
plot(xGrid+dpx,yGrid+dpy,'*','MarkerSize',20)


