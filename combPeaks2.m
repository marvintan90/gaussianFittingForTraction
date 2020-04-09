function imgOut = combPeaks2( imgX , imgY )

    

    global imgF2;  % import matrix image
    global d2;
 
    rangeX = [ (imgX-d2):(imgX+d2) ];
    rangeY = [ (imgY-d2):(imgY+d2) ];
    imgC = imgF2(imgY, imgX) ;
    imgNeigh = imgF2(  rangeY , rangeX );
    % imagesc(imgNeigh);
    
    maxNeigh = max(max(imgNeigh)) ;
    testCon = abs(imgC) - abs(maxNeigh) ;
    % disp(testCon);
    if (  testCon < 0 )
	imgOut = 0;
    else
	imgOut = imgC ;
    end
      
                  
% disp(imgOut);
      
                  
end