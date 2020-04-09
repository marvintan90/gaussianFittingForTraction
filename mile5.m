%--------------------------
%milestone 5
%--------------------------

% Workspace items needed (from 4):
%   coordsd -           coords of bright spots via pkfnd() in dis.
%   coordsr -           coords of bright spots via pkfnd() in ref.
%   coordsdViagauss -   coords of bright spots via detpkViagauss() in dis.
%   coordsrViagauss -   coords of bright spots via detpkViagauss() in ref.
% Functions:
%   incx.m -            increment x coords.
%   incy.m -            increment y coords.
%   blowup.m -          scale up horizontal by 2nd argument, vert by third
%                       argument, centered around (x,y)=4th/5th argument.
%   rot.m -             rotate a list of coords by fi, centered at x&y.
%                       N.B: not used for alignment but it works.

  %  coordsdT = incx(coordsdViagauss,-6.25);
 %   coordsdT=incy(coordsdT,2.5);
  %   coordsdT = rot( coordsdT,590,165, 0.2 ) ;
    % coordsdT=blowup(coordsdT,1.02,1.02,294,298);

%plot results after transformations:
figure; hold on;
% scatter(coordsdT(:,1),coordsdT(:,2),2,'b', "filled");

%-------------------------------------------------------
      coordsdT1 = incx(coordGauss_1230(:,1:2), 15);
      coordsdT1 = incy(coordsdT1, 0);
      coordsdT1 = rot( coordsdT1, mean(coordsdT1(:,1)), mean(coordsdT1(:,2)) , 3 ) ;
scatter(coordsdT1(:,1), coordsdT1(:,2) , 15 		,1);
%---------------------------------------------------------
      coordsdT2 = incx(coordGauss_1250(:,1:2), 23.5);
      coordsdT2 = incy(coordsdT2, -2.2);
      coordsdT2 = rot( coordsdT2, mean(coordsdT2(:,1)), mean(coordsdT2(:,2)) , 0.4 ) ;
scatter(coordsdT2(:,1) , coordsdT2(:,2), 15 		,2);
%-----------------------------------------------------
      coordsdT3 = incx(coordGauss_1304(:,1:2), 30.5);
      coordsdT3 = incy(coordsdT3, -3.3);
      coordsdT3 = rot( coordsdT3, mean(coordsdT3(:,1)), mean(coordsdT3(:,2)) , 1.2 ) ;
scatter(coordsdT3(:,1) , coordsdT3(:,2), 15 		,3);
%------------------------------------------------------------
      coordsdT4 = incx(coordGauss_1324(:,1:2), 22.5);
      coordsdT4 = incy(coordsdT4, -5);
      coordsdT4 = rot( coordsdT4, mean(coordsdT4(:,1)), mean(coordsdT4(:,2)) , 0.5 ) ;
scatter(coordsdT4(:,1) , coordsdT4(:,2) , 15 		,4);
%------------------------------------------------------------------
      coordsdT5 = incx(coordGauss_1329(:,1:2), 25.7);
      coordsdT5 = incy(coordsdT5, 4.5);
      coordsdT5 = rot( coordsdT5, mean(coordsdT5(:,1)), mean(coordsdT5(:,2)) , 0.5 ) ;
scatter(coordsdT5(:,1), coordsdT5(:,2) , 15 	,5  ,  'filled');
%--------------------------------------------------------------
      coordsdT6 = incx(coordGauss_1348(:,1:2), 25.7);
      coordsdT6 = incy(coordsdT6, 4.5);
      coordsdT6 = rot( coordsdT6, mean(coordsdT6(:,1)), mean(coordsdT6(:,2)) , 0.5 ) ;
scatter(coordsdT6(:,1), coordsdT6(:,2) , 15 	,5  ,  'filled');
%--------------------------------------------------------------
% legend('0deg','2deg','4deg','7deg','9deg','12deg');
%  axis equal;
hold off;
%====================
coordsdT5 = [ coordsdT5(:,1:2), coordGauss_9dot5deg(:,3:4) ] ;
coordsdT4 = [ coordsdT4(:,1:2), coordGauss_7deg(:,3:4) ] ;
coordsdT3 = [ coordsdT3(:,1:2), coordGauss_4deg(:,3:4) ] ;
coordsdT2 = [ coordsdT2(:,1:2), coordGauss_2deg(:,3:4) ] ;
coordsdT1 = [ coordsdT1(:,1:2), coordGauss_0deg(:,3:4) ] ;
%===================
storeCoords54 = mapNeighbours( coordsdT5 , coordsdT4 ) ;
storeCoords53 = mapNeighbours( coordsdT5 , coordsdT3 ) ;
storeCoords52 = mapNeighbours( coordsdT5 , coordsdT2 ) ;
storeCoords51 = mapNeighbours( coordsdT5 , coordsdT1 ) ;
%------------------------
sz(1) = size(storeCoords54,1);
sz(2) = size(storeCoords53,1);
sz(3) = size(storeCoords52,1);
sz(4) = size(storeCoords51,1);
minSZ = min(sz);
%---------------------------
combinedCoords(:,:,5) = storeCoords54(1:minSZ,:,1) ; % angle = 9.5 deg
combinedCoords(:,:,4) = storeCoords54(1:minSZ,:,2) ; % angle = 7 deg
combinedCoords(:,:,3) = storeCoords53(1:minSZ,:,2) ; % angle = 4 deg
combinedCoords(:,:,2) = storeCoords52(1:minSZ,:,2) ; % angle = 2 deg
combinedCoords(:,:,1) = storeCoords51(1:minSZ,:,2) ; % angle = 0 deg

% remove rows containing zeros		   
comCoords = removeZeros(combinedCoords) ;
figure; hold on
    scatter(comCoords(:,1,1), comCoords(:,2,1) ,	13 	,51 );
    scatter(comCoords(:,1,2), comCoords(:,2,2) , 	11 	,52  );
    scatter(comCoords(:,1,3), comCoords(:,2,3) , 	9 	,53  );
    scatter(comCoords(:,1,4), comCoords(:,2,4) , 	7 	,54  );
    scatter(comCoords(:,1,5), comCoords(:,2,5) ,	5 	,55  ,  'filled');
    hold off;
%==========================================
storeComCoords = comCoords;
storeComCoords(:,5,:) = comCoords(:,3,:) ./ comCoords(:,4,:);
figure;

storeTrend(:,1:2) = storeComCoords(:,1:2,1);  % use coords of angle = 0 deg
  for n=1:size(storeComCoords(:,1,1),1)
	xy(:,1) = [0,2,4,7,9.5]; % angles
	xy(:,2) = storeComCoords(n,5,:) ;
	[p,S] = polyfit( xy(:,1) , xy(:,2) , 1) ;   % polyfit(x,y,n) ;
	storeTrend(n,3) = p(1);  % gradient 
	storeTrend(n,4) = p(2);  % y-intercept
	storeTrend(n,5) = S.normr ;
	
	yFit = ( p(1).*xy(:,1) ) + p(2) ;
	figure;
	    plot(xy(:,1),xy(:,2),'+b',...
		 xy(:,1),yFit,'-g');
  endfor
%-----------------------------------------
disp("mean of gradient");
    disp( mean( storeTrend(:,3) ) );
disp("stdDev of gradient");
    disp(  std( storeTrend(:,3) ) );
disp("mean of vertical-intercept");
    disp( mean( storeTrend(:,4) ) );
disp("stdDev of vertical-intercept");
    disp(  std( storeTrend(:,4) ) );
disp("mean of normr");
    disp( mean( storeTrend(:,5) ) );
disp("stdDev of normr");
    disp(  std( storeTrend(:,5) ) );

figure;
    scatter( storeTrend(:,1),storeTrend(:,2) , 20 , storeTrend(:,5) , 'filled' );