function newcoords = incx( coords,delta )

newcoords=double(coords)+delta*[ones(size(coords,1),1),zeros(size(coords,1),1)];
end

