%--------------------------
%milestone 5c
%--------------------------

refNeighList = csvread("refNeighList.csv");
cellNeighList = csvread("cellNeighList.csv");

global refCoord ;
global cellCoord ; 
cellCoord = cellNeighList ;
refCoord = refNeighList ;
%--------------------------------------------
alignDiff = cellNeighList - refNeighList ;
figure; axis equal;
  hold on;
   quiver(refNeighList(:,1) , refNeighList(:,2) , alignDiff(:,1) , alignDiff(:,2) ,1.5 , "LineWidth",1, 'color', 'k') ; axis equal;

%--------------------------------------------------------
argIn = [1,-1,0.5 , 1 , 1];
xOut = fmins( @autoAlign , argIn) ;
errorOut2 = autoAlign(xOut) ;
[modRef, origCell] = manualAlign(xOut) ;

%---------------------------------------------------
alignDiff = 0;
alignDiff = origCell - modRef ;
figure; axis equal;
  hold on;
   quiver(refNeighList(:,1) , refNeighList(:,2) , alignDiff(:,1) , alignDiff(:,2) ,1.5 , "LineWidth",1, 'color', 'k') ; axis equal;
   
   
figure; hold on;
scatter(modRef(:,1), modRef(:,2) , 15 		, 'b');
scatter(origCell(:,1) , origCell(:,2), 10 		,'r'  , 'filled'  );

%-------------------
forceX = yToForce(    alignDiff(:,1)*(322.5e-9)    ) ;
forceVector(:,1) = forceX*1e9;  % convert to nanoNewton
forceY = yToForce(    alignDiff(:,2)*(322.5e-9)    ) ;
forceVector(:,2) = forceY*1e9;  % convert to nanoNewton

csvwrite("modRef.csv" , modRef);
csvwrite("alignDiff.csv" , alignDiff);
csvwrite("origCell.csv" , origCell);
csvwrite("forceVector.csv" , forceVector);

