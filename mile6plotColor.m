% mile 6
clear all;
pkg load all;
graphics_toolkit("gnuplot");
%-----------------------------------------------------------------
modRef=  csvread("modRef.csv" );
alignDiff = csvread("alignDiff.csv" );
origCell = csvread("origCell.csv" );
forceVector = csvread("forceVector.csv" );



%------------------------------------------------------
figure; axis equal; hold on;
fluorImg = mat2gray(imread('fluor.tif') );
% fluorImg = double( imread('fluor.tif') );
  imshow(fluorImg, [ ]);
  % image(fluorImg);
 
  
  quiverwcolorbar(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) , 2);
  % vekplot2(x,y,u,v,scale,line,mark,fillcolor)
   %  vekplot2(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,1,1,0,0);
  
  % quiver(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,2, "LineWidth",1, 'color', 'y' );

   % quiverc(modRef(:,1) , modRef(:,2) , forceVector(:,1) , forceVector(:,2) ,2, "LineWidth",1, 'color', 'k') ; axis equal;

  saveas(gcf,'quiverImg2b.eps','epsc') ;
  



hold off;