function newcoords = rot( coords,x,y,fi )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
newcoords=coords-[x*ones(size(coords,1),1),y*ones(size(coords,1),1)];
rot=[cosd(fi) -sind(fi) ; sind(fi) cosd(fi)];
for n = 1:size(coords,1)
    newcoords(n,:)=(rot * newcoords(n,:)')';
end
newcoords=newcoords+[x*ones(size(coords,1),1),y*ones(size(coords,1),1)];
end

