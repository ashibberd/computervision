function [dpx,dpy] = compareOptimisedV2(imageOne,imageTwo,windowSize,varOverlap)

%%initialise
% xGridVO=zeros
% yGridVO=zeros
windowSize=2*floor(windowSize/2);

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

%%adjust window size for overlap
windowSizeVO=2*floor(windowSize*(1+2*varOverlap)/2);

%%set mesh - create call function
[xGrid,yGrid,xPad,yPad] = generateMesh(windowSize,imageOne_grayscale);

[p,q]=size(xGrid);

%%pad first image
imageOne_grayscale=padarray(imageOne_grayscale,[yPad+1,xPad+1],'post');

%%pad first image for variable overlap
%%maybe this should go at the top
xPadVO=ceil(windowSize*varOverlap);
yPadVO=ceil(windowSize*varOverlap);
imageOne_grayscale=padarray(imageOne_grayscale,[yPadVO,xPadVO],'pre');
imageOne_grayscale=padarray(imageOne_grayscale,[yPadVO,xPadVO],'post');

%%pad second image (for variable overlap)
imageTwo_grayscale=padarray(imageTwo_grayscale,[yPad+1,xPad+1],'post');
imageTwo_grayscale=padarray(imageTwo_grayscale,[windowSizeVO+400,windowSizeVO+400],'post');
imageTwo_grayscale=padarray(imageTwo_grayscale,[windowSizeVO,windowSizeVO],'pre');

%%adjust grid for variable overlap
xGridVO=xGrid+xPadVO*ones(p,q);
yGridVO=yGrid+yPadVO*ones(p,q);

%%show grids
% figure()
% imshow(imageOne_grayscale_save)
% hold on
% plot(xGrid,yGrid,'square','MarkerSize',100)

picture = drawWindows(imageOne_grayscale_save,xGrid,yGrid,windowSizeVO);

%%show grids
% figure()
% imshow(imageOne_grayscale)
% hold on
% plot(xGridVO,yGridVO,'square','MarkerSize',100)

picture = drawWindows(imageOne_grayscale,xGridVO,yGridVO,windowSizeVO);

%%show grids
% figure()
% imshow(imageTwo_grayscale)

[dpx,dpy] = compareImages(imageOne_grayscale,imageTwo_grayscale,windowSizeVO,xGridVO,yGridVO);

%%adjust for padding
dpx=dpx+xPadVO*ones(p,q);
dpy=dpy+yPadVO*ones(p,q);

%%show grids
% figure()
% imshow(imageTwo_grayscale_save)
% hold on
% plot(xGrid+dpx,yGrid+dpy,'square','MarkerSize',100)

picture = drawWindows(imageTwo_grayscale_save,xGrid+dpx,yGrid+dpy,windowSizeVO);



end



