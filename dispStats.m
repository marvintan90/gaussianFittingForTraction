disp("mean of xSigma=");
disp(mean(coordsdViagauss(:,3)));
disp("StdDev of xSigma=");
disp(std(coordsdViagauss(:,3)));
disp("mean of ySigma=");
disp(mean(coordsdViagauss(:,4)));
disp("StdDev of ySigma=");
disp(std(coordsdViagauss(:,4)));
disp("mean of (xW / yW) =");
ratioXwYw = coordsdViagauss(:,3) ./ coordsdViagauss(:,4)  ;
disp( mean( ratioXwYw )  ) ;
disp("stdDev of (xW / yW) =");
disp( std( ratioXwYw )  ) ;