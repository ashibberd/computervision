%%start timer
tic;

%%read in images from file
cal_image_left_2000_colour=imread('cal_image_left_2000.tiff');

%%convert RGB to grayscale
cal_image_left_2000_grayscale=rgb2gray(cal_image_left_2000_colour);

%%convert to double precision
cal_image_left_2000_grayscale=im2double(cal_image_left_2000_grayscale);

%%set dot detection parameters
x_max=30;
y_max=30;
x_sd=2;
y_sd=2;
amplitude = 255;
[X_gauss,Y_gauss,dotDetect] = gauss2D(x_max,y_max,x_sd,y_sd,amplitude);

%%calculate cross correlation between gaussian and cal_image
xcorrCalibration = xcorr2(cal_image_left_2000_grayscale,dotDetect);
figure()
contour(xcorrCalibration)

%%coordinates for result
[X,Y] = cal_mesh2D(dotDetect,cal_image_left_2000_grayscale);

%%adjuest for gaussian center
gauss_center = size(X_gauss)/2;
mesh_size = size(X);
X_calibration = X+ones(mesh_size(1),mesh_size(2))*X_gauss(gauss_center(1),gauss_center(2));
Y_calibration = Y+ones(mesh_size(1),mesh_size(2))*Y_gauss(gauss_center(1),gauss_center(2));

%%intialise loop
num_dots = 357; 
result_XY = zeros(num_dots,2);

%%specify deletion zone (even numbers)
delete_X = 60;
delete_Y = 60;
delete_matrix = zeros(delete_Y+1,delete_X+1);

for k=1:num_dots
    
    %%find maximum correlation value and location
    [xcorr_max,index_loc]=max(xcorrCalibration(:));
    [index_y,index_x]=ind2sub(size(xcorrCalibration),index_loc);

    Y_location=Y_calibration(index_y,index_x);
    X_location=X_calibration(index_y,index_x);

    result_XY(k,1)=X_location;
    result_XY(k,2)=Y_location;
    
    %%delete current location
    xcorrCalibration((-delete_Y/2+Y_location):(delete_Y/2+Y_location),(-delete_X/2+X_location):(delete_X/2+X_location)) = delete_matrix;

end

plot(result_XY(:,1),result_XY(:,2),'*')
axis([0 2500 0 1800])
figure()
contour(xcorrCalibration)

%%algorithm performance
performance=toc;
fprintf('The algorithm runtime is %0.1f s\n', performance)



