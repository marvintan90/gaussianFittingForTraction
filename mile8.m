%--------------------------
%milestone 8
%--------------------------


coordGauss_0deg = pll_mile4b(coords_0deg, Im_0deg ) ;
coordGauss_4deg = pll_mile4b(coords_4deg, Im_4deg ) ;
coordGauss_7deg = pll_mile4b(coords_7deg, Im_7deg ) ;
coordGauss_9dot5deg = pll_mile4b(coords_9dot5deg, Im_9dot5deg ) ;
coordGauss_2deg = pll_mile4b(coords_2deg, Im_2deg ) ;


figure; hold on
    scatter(comCoords(:,1), comCoords(:,2) ,	13 	,51 );
    scatter(comCoords(:,3), comCoords(:,4) , 	11 	,52  );
    scatter(comCoords(:,5), comCoords(:,6) , 	9 	,53  );
    scatter(comCoords(:,7), comCoords(:,8) , 	7 	,54  );
    scatter(comCoords(:,9), comCoords(:,10) ,	5 	,55  ,  'filled');
    hold off;