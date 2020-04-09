function newcoords = blowup( coords, factorx, factory , x , y )

newcoords=double(coords)-[x*ones(size(coords,1),1),y*ones(size(coords,1),1)];
newcoords=[newcoords(:,1)*factorx,newcoords(:,2)*factory];
newcoords=newcoords+[x*ones(size(coords,1),1),y*ones(size(coords,1),1)];
end

