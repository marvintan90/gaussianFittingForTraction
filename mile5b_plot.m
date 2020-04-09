figure;
scatter3(  xyzCoords(:,7) , xyzCoords(:,6) , xyzCoords(:,5) , 20 , xyzCoords(:,5) , "filled" );

figure;
scatter(   xyzCoords(:,6) , xyzCoords(:,5) , 20 , xyzCoords(:,7) , "filled" );

%=================================
figure;
x = xyzCoords(:,7) ;
y = xyzCoords(:,6) ;
z = xyzCoords(:,5) ;
tri = delaunay(x,y);
plot(x,y,'.')
% How many triangles are there?
[r,c] = size(tri);
disp(r);
%% Plot it with TRISURF
h = trisurf(tri, x, y, z);
axis vis3d ;
%=============================

figure;
n=50 ;
scatter(  storeComCoords(n,6,:) , storeComCoords(n,5,:)   );
