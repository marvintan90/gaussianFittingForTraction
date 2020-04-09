%--------------------------
%milestone 5b
%--------------------------

%====================

coordsdT2 = coordsdT2(:,1:2) ;
coordsdT1 = coordsdT1(:,1:2) ;
%===================
[ refNeighList  , cellNeighList ] = pllNeigh(coordsdT2, coordsdT1, 8) ;



figure; hold on;
scatter(refNeighList(:,1) , refNeighList(:,2), 15 );
scatter(cellNeighList(:,1) , cellNeighList(:,2), 10 		,'r'  , 'filled'  );

csvwrite("refNeighList.csv" , refNeighList);
csvwrite("cellNeighList.csv" , cellNeighList);
