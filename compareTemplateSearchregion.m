function [dpx1,dpy1] = compareTemplateSearchregion(template,searchRegion)

%%calculate cross correlation - use normalised
xcorrResult = normxcorr2(template,searchRegion);
% figure()
% contour(xcorrResult)
% length(template)

%%find maximum correlation value and location
[~,index_loc]=max(xcorrResult(:));
[index_y,index_x]=ind2sub(size(xcorrResult),index_loc);

%%convert to search region pixel coordinate - keep to square template for
%%now
%%not the missing +1 once you move by templatesize-1 you enter
%%encapsulation by search region
dpx1 = index_x-length(template);
dpy1 = index_y-length(template);
