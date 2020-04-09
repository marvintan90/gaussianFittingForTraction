
xc = mean(  storeComCoords(:,1,1)  ); 
yc = mean(  storeComCoords(:,2,1)  ); 
xMax = max(  storeComCoords(:,1,1)  ); 
yMax = max(  storeComCoords(:,2,1)  ); 
xMin = min(  storeComCoords(:,1,1)  ); 
yMin = min(  storeComCoords(:,2,1)  ); 

xyp = [96,186;
      96,106;
      96,26;
      143,185;
      142,132;
      142,79;
      139,12;
      188,186;
      188,105;
      188,25;];
for m=1:size(xyp,1)
	xp = xyp(m,1);
	yp = xyp(m,2) ;
	range = 5;
	for n=1:size( xyzCoords(:,1) )
	    x = xyzCoords(n,1) ;
	    y = xyzCoords(n,2) ;
	    if ( abs(x-xp) < range ) && ( abs(y-yp) < range )
		nm = xyzCoords(n,7) ;
		disp(nm);
	    endif
	endfor
	
	
	R0 = (2.3e-6)/2 ;
	figure; hold on;
	    xDeg = linspace(0.001,7,100);
	    xRad = xDeg.*(pi/180)  ;
	    angleRad = storeComCoords(nm,6,:).*(pi/180) ;
	    scatter(  storeComCoords(nm,6,:) , storeComCoords(nm,5,:) ,  20 , 'b' , "filled" );
	    A0 = 1.2;
	    [A,resnorm,residual,exitflag,output] = lsqcurvefit(@cosFunc,A0,angleRad, storeComCoords(nm,5,:) );
	    %   scatter(  storeComCoords(nm,6,:) , 1.1*cos(angleRad) , 20, 'r' ) ;
	    % fit with linear line
		    [pp,S] = polyfit( storeComCoords(nm,6,:) , storeComCoords(nm,5,:) , 1) ;   % polyfit(x,y,n) ;
		    yFit = ( pp(1).*xDeg ) + pp(2) ;
		    plot(xDeg, yFit , '-k');
		    plot(xDeg, cosFunc(A,xRad)  , '-g');
	    % plot upper and lower bounds lines
		    R = R0*pp(2) ;
		    runTube4;
		    plot(xDeg , store_k./B , '-m');	   
		    plot(xDeg , -store_g./B , '-c');	
	    xlabel(['xp=' num2str(xp) ' , yp=' num2str(yp) ' , grad=' num2str(pp(1)) ]);	  

endfor