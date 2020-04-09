function [ngx,ngy] = findNeigh(cx, cy)
    global refList;
    global neighDist;
    
    
ngx = 0;
ngy = 0;

    for n=1:size(refList,1)
	dx = cx - refList(n,1) ;
	dy = cy - refList(n,2) ;
	ds = sqrt(  (dx*dx)  + (dy*dy)  ) ;

	
	  if ( (ds - neighDist) < 0 )
	      ngx = refList(n,1) ;
	      ngy = refList(n,2) ;
	  end
	  
    end
    



end