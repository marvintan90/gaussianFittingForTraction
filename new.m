
mile3;
[imgCoords , imgF ] = pllFilter(  Im_df2_10x_disk ,70  ) ;

figure;
scatter(  imgCoords(:,1) , imgCoords(:,2) , 20, imgCoords(:,3) , 'filled');

imgCoordsOut = pllComb(imgCoords , imgF  , 8) ;

figure;
scatter(  imgCoordsOut(:,1) , imgCoordsOut(:,2) , 20, imgCoordsOut(:,3) , 'filled');