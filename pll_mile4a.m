function imgCoordsOut = pll_mile4a(ImgIn,cutoff,neighRad)

      [imgCoords , imgF ] = pllFilter(  ImgIn ,cutoff  ) ;

      % figure;
      % scatter(  imgCoords(:,1) , imgCoords(:,2) , 20, imgCoords(:,3) , 'filled');

      imgCoordsOut = pllComb(imgCoords , imgF  , neighRad) ;

      figure;
      scatter(  imgCoordsOut(:,1) , imgCoordsOut(:,2) , 20, imgCoordsOut(:,3) , 'filled');


end