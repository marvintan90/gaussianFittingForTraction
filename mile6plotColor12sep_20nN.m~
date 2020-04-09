% mile 6
clear all;
pkg load all;
graphics_toolkit("gnuplot");
%-----------------------------------------------------------------
modRef=  csvread("modRef.csv" );
alignDiff = csvread("alignDiff.csv" );
origCell = csvread("origCell.csv" );
forceVector = csvread("forceVector.csv" );

count=1;
for nn=1:size(forceVector, 1)
    dsf = sqrt(  (forceVector(nn,1)^2)  +  (forceVector(nn,2)^2)  )    ;
    if dsf < 30
	new_forceVector(count, 1) = forceVector(nn,1) ;
	new_forceVector(count, 2) = forceVector(nn,2) ;
	new_modRef(count,1) = modRef(nn,1) ;
	new_modRef(count,2) = modRef(nn,2) ;
	count++ ;
	
    end
end




%------------------------------------------------------
figure; axis equal; hold on;


plotBorders = [1388 , 1040 ; 
		1, 1 ; 
		1, 1040 ;
		1388 , 1 ;];
		
scatter( plotBorders(:,1) , plotBorders(:,2)  ,  5 ,  'r' , 'filled') ;
  
  quiverwcolorbar(new_modRef(:,1) , new_modRef(:,2) , new_forceVector(:,1) , new_forceVector(:,2) , 2);
  % vekplot2(x,y,u,v,scale,line,mark,fillcolor)
   %  vekplot2(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,1,1,0,0);
  
  % quiver(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,2, "LineWidth",1, 'color', 'y' );

   % quiverc(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,2, "LineWidth",1, 'color', 'k') ; axis equal;

  saveas(gcf,'quiverImg_12sep.eps','epsc') ;
  



hold off;
