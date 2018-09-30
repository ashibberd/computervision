function [X,Y] = cal_mesh2D(template,region)

%%create result meshgrid
[M,N]=size(region);
[m,n]=size(template);

%%setup true cooridinates for correlation result
x_min=-(n-1);
x_max=(N+n-2)+x_min;
y_min=-(m-1);
y_max=(M+m-2)+y_min;
x = x_min:x_max;
y = y_min:y_max;
[X,Y] = meshgrid(x,y);

end
