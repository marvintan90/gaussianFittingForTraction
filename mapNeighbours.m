function storeCoords = mapNeighbours( coordsdT5 , coordsdT4 )

    %for every coord in coordsr, finds the closest coordinate in coordsd
    % and store the results in coordsdiffs:
    storeCoords = [0,0,0,0];
    for m=1:size(coordsdT5,1)
	  ds=8;
	  for n=1:size(coordsdT4,1)
		[ddx,ddy,dds]=coorddiff(  coordsdT5(m,1:2)   ,   coordsdT4(n,1:2)  );
		if dds<ds
		    storeCoords(m,:,1) = [coordsdT5(m,:)];  %  reference
		    storeCoords(m,:,2) = [coordsdT4(n,:)];  %  comparison
		endif
	  endfor
    endfor
    figure; hold on;
    scatter(storeCoords(:,1,1) , storeCoords(:,2,1) , 15	,6);   % reference
    scatter(storeCoords(:,1,2) , storeCoords(:,2,2) , 15 	,7  ,  'filled');  % comparison
    hold off
 %-------------------------------------------
    storeDiff(:,1) = storeCoords(:,1,1) - storeCoords(:,1,2) ;  % x
    storeDiff(:,2) = storeCoords(:,2,1) - storeCoords(:,2,2) ;  % y
    figure;
    scatter( storeDiff(:,1) , storeDiff(:,2) );

end