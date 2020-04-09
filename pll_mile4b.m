function coordsOut = pll_mile4b(coords,Im)

    %use gaussian to determine spots:

    [coordsViagauss,pkshift]=detpkViagauss(coords,Im);
    coordsOut = coordsViagauss ; % coordsViagauss(:,1:2) ;



    figure; 
	scatter(coordsViagauss(:,1),coordsViagauss(:,2),20, 'b', "filled");

    disp("mean of xSigma=");
    disp(mean(coordsViagauss(:,3)));
    disp("StdDev of xSigma=");
    disp(std(coordsViagauss(:,3)));
    disp("mean of ySigma=");
    disp(mean(coordsViagauss(:,4)));
    disp("StdDev of ySigma=");
    disp(std(coordsViagauss(:,4)));
    disp("mean of (xW / yW) =");
    ratioXwYw = coordsViagauss(:,3) ./ coordsViagauss(:,4)  ;
    disp( mean( ratioXwYw )  ) ;
    disp("stdDev of (xW / yW) =");
    disp( std( ratioXwYw )  ) ;


end