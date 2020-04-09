function [outXZ, outYZ] = getMid(M,xdata)

    sizeRow = size(xdata,1) ;
    sizeCol = size(xdata,2) ;
    midRow = int32( (sizeRow-1)/2 )+1;
    midCol = int32( (sizeCol-1)/2 )+1;
    
    xAxis = xdata(midRow,:,1);  % choose middle row only
    yAxis = xdata(:,midCol,2);  % choose middle col only
    
    xZ = M(midRow,:);  % choose middle row only
    yZ = M(:,midCol);  % choose middle col only
    
    outXZ = [xAxis', xZ'];
    outYZ = [yAxis, yZ];
    
 end
    