function imgF = pllFilter(Im_in , minVal)
    tic;

	  global minVal;
	  minVal = 70;
	  
	  global Im;
	  Im = Im_in;
	  
	  
	  nxMax = size(Im,2) ;  % columns  
	  nyMax = size(Im,1) ;  % rows  
	  
	  n = 1;
	  for nx = [1:nxMax]
	      for ny = [1:nyMax]
		  nxny( n , 1) = nx ;
		  nxny( n , 2) = ny ;
		  n++;
	      end
	  end
	  disp( size(nxny) );
	  nx = nxny(:,1);
	  ny = nxny(:,2);
	  
    toc;
    tic;
      
	  outList_cell = pararrayfun ( nproc(), @marvFilter,  (nx),(ny) );
	  
    toc;
    tic;
	  m=1;
	  for n=1:size(outList_cell,1)
	      if ( outList_cell(n) > 0.5 )
		  ImFiltered(m,1) = nx(n);
		  ImFiltered(m,2) = ny(n);
		  ImFiltered(m,3) = outList_cell(n);
		  m++;
	      end
	  end
	  
    toc;

    imgF(nyMax, nxMax) = 0;

    tic;
	  for mm=1:size(ImFiltered,1)
	      imgF( ImFiltered(mm,2) , ImFiltered(mm,1) ) = ImFiltered(mm,3) ;
	  end      
    toc;

end      