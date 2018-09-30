function [X,Y] = calibrationMesh(x_min,x_max,x_res,y_min,y_max,y_res)

%%setup true cooridinates for correlation result
x = x_min:x_res:x_max;
y = y_min:y_res:y_max;
[P,Q] = meshgrid(x,y);

X=P(:);
Y=Q(:);

end
