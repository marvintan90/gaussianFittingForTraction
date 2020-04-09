function out = matrixToScatter(M,xdata)
    mid = int32( size(xdata,1) / 2  ) ;
    xGrid = xdata(mid,:,1) ;  % get columns
    yGrid = xdata(:,mid,2)' ;  % get rows
    
    m=1;
    for nRow=1:size(M,1)  % rows = y
         for nCol=1:size(M,2)  % columns = x
              out(m,:) = [xdata(nRow,nCol,1) , xdata(nRow,nCol,2) , M(nRow,nCol) ];
              m++;
         endfor
    endfor
 
 
 end
    