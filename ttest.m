imgX = 82;
imgY = 80;
d = 8/2;

    global imgF;  % import matrix image
    global d;
 
    rangeX = [ (imgX-d):(imgX+d) ];
    rangeY = [ (imgY-d):(imgY+d) ];
    imgC = imgF(imgY, imgX) ;
    imgNeigh = imgF(  rangeY , rangeX );
     imagesc(imgNeigh);
    
    maxNeigh = max(max(imgNeigh)) ;
     disp(maxNeigh);
    if ( imgC < maxNeigh  )
	imgOut = 0;
    else
	imgOut = imgC ;
    end
      
                  
disp(imgOut);