function [modifiedRef , cellCoord] = manualAlign(x)

  dx = x(1);
  dy = x(2);
  theta = x(3) ;
  factorx = x(4);
   factory = x(5);

global refCoord ;
global cellCoord ; 


      modifiedRef = incx( refCoord  , dx);  % cell image
      modifiedRef = incy( modifiedRef , dy);
     modifiedRef = rot( modifiedRef , mean(modifiedRef(:,1)), mean(modifiedRef(:,2)) , theta) ;
     modifiedRef = blowup( modifiedRef, factorx, factory , mean(modifiedRef(:,1)), mean(modifiedRef(:,2))  );


end