function out = removeZeros(combinedCoords)
    %  remove zeros
    q=1;
    for k=1:size(combinedCoords,1)
	val = min( abs(combinedCoords(k,1:2,:)) );
	if val>0
	    out(q,:,:) = combinedCoords(k,:,:) ;
	    q++;
	endif
    endfor
end