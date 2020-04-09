%% Making Surface Plots From Scatter Data
% How do you turn a collection of XYZ triplets into a surface plot? This is
% the most frequently asked 3D plotting question that I got when I was in
% Tech Support.

x=out(:,1) ;
y=out(:,2) ;
z=out(:,3) ;


%% Little triangles
% The solution is to use Delaunay triangulation. Let's look at some
% info about the "tri" variable.

tri = delaunay(x,y);
% figure;
% plot(x,y,'.')

%%
% How many triangles are there?

[r,c] = size(tri);
disp(r)

%% Plot it with TRISURF

h = trisurf(tri, x, y, z);
% axis vis3d

%% Clean it up

% axis off
% l = light('Position',[-50 -15 29])
% set(gca,'CameraPosition',[208 -50 7687])
% lighting phong
% shading interp
% colorbar EastOutside