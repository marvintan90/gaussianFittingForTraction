
%--------------------------
%milestone 6 & 7
%--------------------------
% Workspace items needed (from 4):
%   coordsdT -          Transformed form of coordsdViagauss.
%   coordsrViagauss -   coords of bright spots via detpkViagauss() in ref.
% Functions:
%   coorddiff.m -       find the difference between 1 coord and another &
%                       outputs dx dy ds.
%   vectarrow.m -       Function found online: draws an arrow from 1 coord
%                       to another.


%
%milestone 6
%
%for every coord in coordsr, finds the closest coordinate in coordsd
% and store the results in coordsdiffs:
coordsdiffs=[];
for m=1:size(coordsrViagauss,1)
    ds=5;
    for n=1:size(coordsdT,1)
        [ddx,ddy,dds]=coorddiff(coordsrViagauss(m,:),coordsdT(n,:));
        if dds<ds
            dx=ddx; dy=ddy; ds=dds;
        end
    end
    coordsdiffs=[coordsdiffs;dx dy ds coordsrViagauss(m,:)];
end


%
%milestone 7
%
% use vectarrow to draw plot
figure;
% quiver(x,y,u,v) ;
quiver(coordsdiffs(:,4) , coordsdiffs(:,5) , coordsdiffs(:,1) , coordsdiffs(:,2) , "LineWidth",2) ;
axis equal;
%=========================
disp("end");