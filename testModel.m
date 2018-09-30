function zCoordinate = testModel(beta)

%%test model
%%read in images from file 
test_left_1_colour=imread('test_left_1.tiff');
test_right_1_colour=imread('test_right_1.tiff');

%%convert RGB to grayscale
test_left_1_grayscale=rgb2gray(test_left_1_colour);
test_right_1_grayscale=rgb2gray(test_right_1_colour);

%%convert to double precision
test_left_1_grayscale=im2double(test_left_1_grayscale);
test_right_1_grayscale=im2double(test_right_1_grayscale);

%%initalise result vectors
leftXi=zeros(117,1);
leftYj=zeros(117,1);
rightXi=zeros(117,1);
rightYj=zeros(117,1);

%%calculate pixel locations
calibrationDot_test_left = dotDetectionFunction2(test_left_1_grayscale);
calibrationDot_test_right = dotDetectionFunction2(test_right_1_grayscale);

%%pixel result vectors for fitting
leftXi(:,1)=calibrationDot_test_left(:,1);
leftYj(:,1)=calibrationDot_test_left(:,2);

rightXi(:,1)=calibrationDot_test_right(:,1);
rightYj(:,1)=calibrationDot_test_right(:,2);

leftPixelX=leftXi(:);
leftPixelY=leftYj(:);
rightPixelX=rightXi(:);
rightPixelY=rightYj(:);

%%current model is ~ - 0.000088557*x1^2 - 1.7368*x1 - 0.000088284*x3^2 + 2.1764*x3 - 0.00038368*x2 + 0.00038621*x4 + 1725.9
interceptZ=ones(117,1);
parametrisationMatrix=[interceptZ leftPixelX leftPixelY rightPixelX rightPixelY leftPixelX.^2 rightPixelX.^2];
zCoordinate=parametrisationMatrix*beta';
plot(zCoordinate)
