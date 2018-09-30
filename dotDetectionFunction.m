function calibrationVector = dotDetectionFunction(calibrationPlate)

%%set dot detection parameters
x_max=30;
y_max=30;
x_sd=2;
y_sd=2;
amplitude = 255;
[X_gauss,Y_gauss,dotDetect] = gauss2D(x_max,y_max,x_sd,y_sd,amplitude);

%%calculate cross correlation between gaussian and cal_image
xcorrCalibration = xcorr2(calibrationPlate,dotDetect);
% figure()
% contour(xcorrCalibration)

%%coordinates for result
[X,Y] = cal_mesh2D(dotDetect,calibrationPlate);

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

% plot(result_XY(:,1),result_XY(:,2),'*')
% axis([0 2500 0 1800])
% figure()
% contour(xcorrCalibration)

%%take care with tolerances here come back to
dotMarkers = sortrows(result_XY);

%%loop to get sorting with tolerance
for k=1:21
    
    dotMarkers(((17*(k-1)+1):17*k),:) = sortrows(dotMarkers(((17*(k-1)+1):17*k),:),2);
    
end

calibrationVector = dotMarkers;

end



