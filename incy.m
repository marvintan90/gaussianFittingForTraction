function newcoords = incy( coords,delta )

newcoords=double(coords)+delta*[zeros(size(coords,1),1),ones(size(coords,1),1)];
end

