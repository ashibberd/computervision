function [dpx,dpy] = compareImages(imageOne,imageTwo,windowSize,xGrid,yGrid)

%%work with square window size to start
%%xgrid and ygrid will be meshgrids
%%break up inageOne into windows

[M,N]=size(xGrid);

%%intialise dpx dpy
dpx = zeros(M,N);
dpy = zeros(M,N);

%%window size factor for search region

%%needs to be some sort of pre-processing padding

%%loop over all windows



for p=1:M
    
    for k=1:N
        
        xCenter=xGrid(p,k);
        yCenter=yGrid(p,k); 
        
        %%template
        xLeftT=xCenter-windowSize/2;
        xRightT=xCenter+windowSize/2;
        yLeftT=yCenter-windowSize/2;
        yRightT=yCenter+windowSize/2;
        
        %%search region
        xLeftSR=xCenter-windowSize/2-windowSize+windowSize;
        xRightSR=xCenter+windowSize/2+windowSize+windowSize;
        yLeftSR=yCenter-windowSize/2-windowSize+windowSize;
        yRightSR=yCenter+windowSize/2+windowSize+windowSize;
        
        %%note template one unit bigger than window size
        template=imageOne(yLeftT:yRightT,xLeftT:xRightT);
        searchRegion=imageTwo(yLeftSR:yRightSR,xLeftSR:xRightSR);
%         figure()
%         imshow(template)
%         figure()
%         imshow(searchRegion)
%         size(searchRegion);
        
        [dpx1,dpy1] = compareTemplateSearchregion(template,searchRegion);
        dpx(p,k) = dpx1 - windowSize;
        dpy(p,k) = dpy1 - windowSize;
        
        
    end
    
end

end
