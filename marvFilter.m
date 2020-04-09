function out = marvFilter(nx,ny)
    global Im;
    global minVal;
    
    bWd = 10;
    nxMax = size(Im,2) ;  % columns
    nyMax = size(Im,1) ;  % rows
    nxBd = nxMax - bWd;
    nyBd = nyMax - bWd;

   


                    if ( Im(ny,nx) > minVal )  && (nx>bWd) && (nx<nxBd) && (ny>bWd) && (ny<nyBd)
                        out = Im(ny,nx) ;
                      
                    else
			out = 0 ;
                    end


end