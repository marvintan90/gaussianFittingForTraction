
coordsdT2 = coordsdT2(:,1:2) ; % cell
coordsdT1 = coordsdT1(:,1:2) ; % ref

global refList;
refList = coordsdT1 ;
    global neighDist;
neighDist = 8;
%===================
figure; hold on;
scatter(refList(:,1) , refList(:,2), 15 );
scatter(coordsdT2(:,1) , coordsdT2(:,2), 10 		,'r'  , 'filled'  );

cx = coordsdT2(100,1)   % cell
cy = coordsdT2(100,2)   % cell
[ngx,ngy] = findNeigh(cx, cy) 