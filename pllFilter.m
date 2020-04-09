function [ImFiltered , imgF ] = pllFilter(Im_in , minVal_in)
    tic;

	  global minVal;
	  minVal = minVal_in;
	  
	  global Im;
	  Im = Im_in;
	  
	  
	  nxMax = size(Im,2) ;  % columns  
	  nyMax = size(Im,1) ;  % rows  
	  
	  nxny = [1,1];
	  n = 1;
	  for nx = [1:nxMax]
	  
	      %{
	      for ny = [1:nyMax]
		  nxny( n , 1) = nx ;
		  nxny( n , 2) = ny ;
		  n++;
	      end
	      %}
	      
	      addHere(:,1) = nx*ones(nyMax,1)';
	      addHere(:,2) = [1:1:nyMax];
	      nxny = [nxny; addHere];
	     
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