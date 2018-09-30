function [X,Y] = gauss2D(x_max,y_max,x_sd,y_sd,amplitude)

%%define mesh for gaussian
%%check appropriate x_max/x_res etc.

x_center = x_max/2;
y_center = y_max/2;

x = 1:x_max;
y = 1:y_max;
[X,Y] = meshgrid(x,y);

X_c = ones(length(y),length(x))*x_center;
Y_c = ones(length(y),length(x))*y_center;

%%calculate gaussian
exponent = -(((X-X_c).^2)/(2*x_sd^2)+((Y-Y_c).^2)/(2*y_sd^2));
dotDetect = amplitude*exp(exponent);

%%plot
%%figure()
%%surf(X,Y,dotDetect)