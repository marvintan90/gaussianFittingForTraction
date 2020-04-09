function [ dx, dy, ds ] = coorddiff( coord1, coord2 )
%coorddiff Summary of this function goes here
%   finds the difference between coords1 and coord 2
%   outputs dx, dy, and ds=sqrt(dx^2+dy^2)
d=coord2-coord1;
dx=d(1);
dy=d(2);
ds=sqrt( (dx*dx) + (dy*dy) );

end

