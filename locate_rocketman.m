%%start timer
tic;

%%read in images from file
maze_colour=imread('rocketman_maze.png');
rocketman=imread('rocketman_himself.png');

%%convert RGB to grayscale
maze=rgb2gray(maze_colour);
rocketman=rgb2gray(rocketman);

%%convert to double precision
maze=im2double(maze);
rocketman=im2double(rocketman);

%%input two matrices into normalised 2D spatial cross correlation function
[X,Y,xcorr_result] = norm_spatial_xcorr_2D(maze,rocketman);


%%find maximum correlation value and location
[xcorr_max,index_loc]=max(xcorr_result(:));
[index_y,index_x]=ind2sub(size(xcorr_result),index_loc);

lag_y=Y(index_y,index_x);
lag_x=X(index_y,index_x);

%%select location for star - with some (.,.) parameter for central take m/2
%%n/2

[m,n]=size(rocketman);
location_y=lag_y+round(m/2);
location_x=lag_x+round(n/2);

%%sanity check plot 
figure
contourf(X,Y,xcorr_result)
set(gca,'YDir','reverse')

%%insert marker - need toolbox to do nicely
%%pointer=insertMarker(maze_colour,[M-location_y location_x],'*','color','red','size',10);
%%for now use clunky method
maze_colour=im2double(maze_colour);
%%black box near rocket man
maze_colour(location_y:location_y+round(m/5),location_x:location_x+round(n/5),1:3)=zeros(round(m/5)+1,round(n/5)+1,3);

figure
imshow(maze_colour)

%%algorithm performance
performance=toc;
fprintf('The algorithm runtime is %0.1f s\n', performance)



