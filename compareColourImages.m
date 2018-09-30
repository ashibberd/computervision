function [dpx,dpy] = compareColourImages(imageOne,imageTwo,windowSize)

%%convert RGB to grayscale
imageOne_grayscale=rgb2gray(imageOne);
imageTwo_grayscale=rgb2gray(imageTwo);

%%convert to double precision
imageOne_grayscale=im2double(imageOne_grayscale);
imageTwo_grayscale=im2double(imageTwo_grayscale);
imageOne_grayscale_save=im2double(imageOne_grayscale);
imageTwo_grayscale_save=im2double(imageTwo_grayscale);


%%set parameters
%%note template will be +1 on window size (middle section)
fWindow=1;

%%set mesh - create call function
[xGrid,yGrid,xPad,yPad] = generateMesh(windowSize,imageOne_grayscale);

%%pad first image
imageOne_grayscale=padarray(imageOne_grayscale,[yPad+1,xPad+1],'post');

%%pad second image
imageTwo_grayscale=padarray(imageTwo_grayscale,[yPad+1,xPad+1],'post');
imageTwo_grayscale=padarray(imageTwo_grayscale,[windowSize,windowSize],'post');
imageTwo_grayscale=padarray(imageTwo_grayscale,[windowSize,windowSize],'pre');

%%show grids
figure()
imshow(imageOne_grayscale_save)
hold on
plot(xGrid,yGrid,'*','MarkerSize',20)

[dpx,dpy] = compareImages(imageOne_grayscale,imageTwo_grayscale,windowSize,xGrid,yGrid);

%%show grids
figure()
imshow(imageTwo_grayscale_save)
hold on
plot(xGrid+dpx,yGrid+dpy,'*','MarkerSize',20)
end



