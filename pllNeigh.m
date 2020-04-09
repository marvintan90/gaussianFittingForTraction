function [outListRef , outListCell ] = pllNeigh(cellList, refListIn, neighDistIn)

    global refList;
    refList = refListIn ;
    global neighDist;
    neighDist = neighDistIn ;

tic;
      [ refNeighList(:,1) , refNeighList(:,2)] = pararrayfun ( nproc(), @findNeigh,  (cellList(:,1))  ,  (cellList(:,2)) );
toc;


tic;
    m=1;
    for n=1:size(refNeighList, 1)
	if ( (refNeighList(n,1) != 0) && (refNeighList(n,2) != 0) )
	    outListRef(m,1) = refNeighList(n,1) ;
	    outListRef(m,2) = refNeighList(n,2) ;
	    
	    outListCell(m,1) = cellList(n,1) ;
	    outListCell(m,2) = cellList(n,2) ;
	    m++;
	end
    end
	    
	
toc;
    
    
end