%%calibration grid in mm
x_min=-500;
x_max=500;
x_res=50;
y_min=0;
y_max=800;
y_res=50;

[calibrationX,calibrationY] = calibrationMesh(x_min,x_max,x_res,y_min,y_max,y_res);

%%intialise
dummyX=zeros(357,6);
dummyY=zeros(357,6);
dummyZ=zeros(357,6);

for k=1:6
    
    dummyX(:,k)=calibrationX;
    dummyY(:,k)=calibrationY;
    dummyZ(:,k)=(1900+(k-1)*20)*ones(357,1);
    
end

calibrationVectorX = dummyX(:);
calibrationVectorY = dummyY(:);
calibrationVectorZ = dummyZ(:);


%%read in images from file (storage??)
cal_image_left_2000_colour=imread('cal_image_left_2000.tiff');
cal_image_left_1980_colour=imread('cal_image_left_1980.tiff');
cal_image_left_1960_colour=imread('cal_image_left_1960.tiff');
cal_image_left_1940_colour=imread('cal_image_left_1940.tiff');
cal_image_left_1920_colour=imread('cal_image_left_1920.tiff');
cal_image_left_1900_colour=imread('cal_image_left_1900.tiff');

cal_image_right_2000_colour=imread('cal_image_right_2000.tiff');
cal_image_right_1980_colour=imread('cal_image_right_1980.tiff');
cal_image_right_1960_colour=imread('cal_image_right_1960.tiff');
cal_image_right_1940_colour=imread('cal_image_right_1940.tiff');
cal_image_right_1920_colour=imread('cal_image_right_1920.tiff');
cal_image_right_1900_colour=imread('cal_image_right_1900.tiff');

%%convert RGB to grayscale
cal_image_left_2000_grayscale=rgb2gray(cal_image_left_2000_colour);
cal_image_left_1980_grayscale=rgb2gray(cal_image_left_1980_colour);
cal_image_left_1960_grayscale=rgb2gray(cal_image_left_1960_colour);
cal_image_left_1940_grayscale=rgb2gray(cal_image_left_1940_colour);
cal_image_left_1920_grayscale=rgb2gray(cal_image_left_1920_colour);
cal_image_left_1900_grayscale=rgb2gray(cal_image_left_1900_colour);

cal_image_right_2000_grayscale=rgb2gray(cal_image_right_2000_colour);
cal_image_right_1980_grayscale=rgb2gray(cal_image_right_1980_colour);
cal_image_right_1960_grayscale=rgb2gray(cal_image_right_1960_colour);
cal_image_right_1940_grayscale=rgb2gray(cal_image_right_1940_colour);
cal_image_right_1920_grayscale=rgb2gray(cal_image_right_1920_colour);
cal_image_right_1900_grayscale=rgb2gray(cal_image_right_1900_colour);

%%convert to double precision
cal_image_left_2000_grayscale=im2double(cal_image_left_2000_grayscale);
cal_image_left_1980_grayscale=im2double(cal_image_left_1980_grayscale);
cal_image_left_1960_grayscale=im2double(cal_image_left_1960_grayscale);
cal_image_left_1940_grayscale=im2double(cal_image_left_1940_grayscale);
cal_image_left_1920_grayscale=im2double(cal_image_left_1920_grayscale);
cal_image_left_1900_grayscale=im2double(cal_image_left_1900_grayscale);

cal_image_right_2000_grayscale=im2double(cal_image_right_2000_grayscale);
cal_image_right_1980_grayscale=im2double(cal_image_right_1980_grayscale);
cal_image_right_1960_grayscale=im2double(cal_image_right_1960_grayscale);
cal_image_right_1940_grayscale=im2double(cal_image_right_1940_grayscale);
cal_image_right_1920_grayscale=im2double(cal_image_right_1920_grayscale);
cal_image_right_1900_grayscale=im2double(cal_image_right_1900_grayscale);

%%initalise result vectors
leftXi=zeros(357,6);
leftYj=zeros(357,6);
rightXi=zeros(357,6);
rightYj=zeros(357,6);

%%calculate pixel locations
calibrationDot_L2000 = dotDetectionFunction(cal_image_left_2000_grayscale);
calibrationDot_L1980 = dotDetectionFunction(cal_image_left_1980_grayscale);
calibrationDot_L1960 = dotDetectionFunction(cal_image_left_1960_grayscale);
calibrationDot_L1940 = dotDetectionFunction(cal_image_left_1940_grayscale);
calibrationDot_L1920 = dotDetectionFunction(cal_image_left_1920_grayscale);
calibrationDot_L1900 = dotDetectionFunction(cal_image_left_1900_grayscale);

calibrationDot_R2000 = dotDetectionFunction(cal_image_right_2000_grayscale);
calibrationDot_R1980 = dotDetectionFunction(cal_image_right_1980_grayscale);
calibrationDot_R1960 = dotDetectionFunction(cal_image_right_1960_grayscale);
calibrationDot_R1940 = dotDetectionFunction(cal_image_right_1940_grayscale);
calibrationDot_R1920 = dotDetectionFunction(cal_image_right_1920_grayscale);
calibrationDot_R1900 = dotDetectionFunction(cal_image_right_1900_grayscale);

%%pixel result vectors for fitting
leftXi(:,1)=calibrationDot_L1900(:,1);
leftXi(:,2)=calibrationDot_L1920(:,1);
leftXi(:,3)=calibrationDot_L1940(:,1);
leftXi(:,4)=calibrationDot_L1960(:,1);
leftXi(:,5)=calibrationDot_L1980(:,1);
leftXi(:,6)=calibrationDot_L2000(:,1);

leftYj(:,1)=calibrationDot_L1900(:,2);
leftYj(:,2)=calibrationDot_L1920(:,2);
leftYj(:,3)=calibrationDot_L1940(:,2);
leftYj(:,4)=calibrationDot_L1960(:,2);
leftYj(:,5)=calibrationDot_L1980(:,2);
leftYj(:,6)=calibrationDot_L2000(:,2);

rightXi(:,1)=calibrationDot_R1900(:,1);
rightXi(:,2)=calibrationDot_R1920(:,1);
rightXi(:,3)=calibrationDot_R1940(:,1);
rightXi(:,4)=calibrationDot_R1960(:,1);
rightXi(:,5)=calibrationDot_R1980(:,1);
rightXi(:,6)=calibrationDot_R2000(:,1);

rightYj(:,1)=calibrationDot_R1900(:,2);
rightYj(:,2)=calibrationDot_R1920(:,2);
rightYj(:,3)=calibrationDot_R1940(:,2);
rightYj(:,4)=calibrationDot_R1960(:,2);
rightYj(:,5)=calibrationDot_R1980(:,2);
rightYj(:,6)=calibrationDot_R2000(:,2);

leftPixelX=leftXi(:);
leftPixelY=leftYj(:);
rightPixelX=rightXi(:);
rightPixelY=rightYj(:);

%%calibration fits (note tuning already done)
modelX=polyfitn([leftPixelX,leftPixelY,rightPixelX,rightPixelY],calibrationVectorX,{'constant','x1','x2','x3','x4'});
modelY=polyfitn([leftPixelX,leftPixelY,rightPixelX,rightPixelY],calibrationVectorY,{'constant','x1','x2','x3','x4'});
modelZ=polyfitn([leftPixelX,leftPixelY,rightPixelX,rightPixelY],calibrationVectorZ,{'constant','x1','x2','x3','x4','x1^2','x3^2'});

%%Zmodel coefficients for depth
beta = modelZ.Coefficients;









