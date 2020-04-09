function ImFiltered = pllComb(imgCoords , imgFin , dd)
  global imgF2;
  global d2;
  imgF2 = imgFin;
  d2 = dd;
  
  imgCoordsOut(:,1) = imgCoords(:,1);
  imgCoordsOut(:,2) = imgCoords(:,2);
  cx = imgCoords(:,1) ;
  cy = imgCoords(:,2) ;
    
  tic;
      imgCoordsOut(:,3)  = pararrayfun ( nproc(), @combPeaks2, (cx) , (cy)  );  
  toc;
  
  
  % now remove zeros
   tic;
	  m=1;
	  for n=1:size(imgCoordsOut,1)
	      if ( imgCoordsOut(n,3) > 0.5 )
		  ImFiltered(m,1) = imgCoordsOut(n,1) ;
		  ImFiltered(m,2) = imgCoordsOut(n,2) ;
		  ImFiltered(m,3) =  imgCoordsOut(n,3) ;
		  m++;
	      end
	  end
	  
    toc;
  
  % csvwrite('ImFiltered.csv',ImFiltered);


end

