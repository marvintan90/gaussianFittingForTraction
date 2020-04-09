figure;
scatter3(  xyzCoords(:,7) , xyzCoords(:,6) , xyzCoords(:,5) , 20 , xyzCoords(:,5) , "filled" );

figure;
scatter(   xyzCoords(:,6) , xyzCoords(:,5) , 20 , xyzCoords(:,7) , "filled" );

mmm = size(   storeComCoords(:,6,1)   ,1) ;
for n=1:mmm
    figure;
    scatter(  storeComCoords(n,6,:) , storeComCoords(n,5,:)   );    
endfor
