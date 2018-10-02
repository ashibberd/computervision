function [picture] = drawWindows(image,xCenterGrid,yCenterGrid,windowSize)

[M,N]=size(xCenterGrid);

figure()
imshow(image)
hold on

%plot centers and labels
plot(xCenterGrid,yCenterGrid,'*','MarkerSize',10)

for k=1:N
    
    for p=1:M
        
        myRectangle = rectangle('Position',[xCenterGrid(p,k)-1-windowSize/2 yCenterGrid(p,k)-1-windowSize/2 windowSize+1 windowSize+1]);
        myRectangle.EdgeColor = 'r';
        
    end
end

picture=1;
hold off
        
        
        