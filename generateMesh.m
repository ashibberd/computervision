function [xGrid,yGrid,xPad,yPad] = generateMesh(windowSize,imageOne)

[M,N]=size(imageOne);

%%split image up into windows
%%window size must be even
blockSize=windowSize+1;

x_min=1+windowSize/2;
x_max=N;
x_res=blockSize;
y_min=1+windowSize/2;
y_max=M;
y_res=blockSize;
x = x_min:x_res:x_max;
y = y_min:y_res:y_max;
[xGrid,yGrid] = meshgrid(x,y);


[m,n]=size(xGrid);
xPad=max(0,windowSize+(n-1)*blockSize-N);
yPad=max(0,windowSize+(m-1)*blockSize-M);
