% mile 6
%  modRef
%  modifiedCell
%  alignDiff
%-----------------------------------------------------------------

ds = sqrt(  (alignDiff(:,1).^2)  +  (alignDiff(:,2).^2)  );
force = yToForce(    ds*(322.5e-9)    ) ;
force = force*1e9;  % convert to nanoNewton

%-----------------------------------------------

figure; axis equal;
fluorImg = double( imread('fluor.tif') );
  image(fluorImg);
  hold on;
   quiver(modRef(:,1) , modRef(:,2) , alignDiff(:,1) , alignDiff(:,2) ,2, "LineWidth",1, 'color', 'k') ; axis equal;
   % quiver(storeCoords(:,1) , storeCoords(:,2) , storeCoords(:,3) , storeCoords(:,4) , arrowScale , "LineWidth",1, 'color', 'blue') ;
   scatter( modRef(:,1) , modRef(:,2) , 2, force , 'filled' ); colorbar;
   % scatter(storeCoords(:,1) , storeCoords(:,2), dotSize, storeCoords(:,5), 'filled') ; colorbar;
  saveas(gcf,'quiverImg.eps','epsc') ;
hold off;
  

%------------------------------------------------------
ds = ds*322.5 ;  % multipy by 322.5nm
figure;
    hist( ds ,10 ) ;
    
    disp('mean error= ');
    disp(  mean(ds)  );
    disp('median error= ');
    disp(  median(ds)  );
%--------------------------    
figure;
    hist( force ,10 ) ;
    
    disp('mean error= ');
    disp(  mean(force)  );
    disp('median error= ');
    disp(  median(force)  );
