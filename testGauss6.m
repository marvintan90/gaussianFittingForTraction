n=6;coordsc = coords_df_10x_disk;Im_cell = Im_df_10x_disk ;%-----------------------------------%  xc =  72 ; %  coordsc(n,1);%  yc =  85 ; %  coordsc(n,2);xc =    coordsc(n,1);yc =    coordsc(n,2);[xr,yr] = buildcoords(xc,yc,Im_cell);z=Im_cell(yr,xr);  % row=y, column=xfigure;      surf(z);      view(2);      [x,resnorm,residual,exitflag,output,xdata, xpk, ypk, xSig, ySig] = D2GaussFit(z) ;      MdataSize=size(xdata,1)-1;      [X,Y] = meshgrid(  int32(-MdataSize/2) :0.1: int32(MdataSize/2)  );      xdataG = zeros(size(X,1),size(Y,2),2);      xdataG(:,:,1) = X;      xdataG(:,:,2) = Y;      fit=D2GaussFunction(x,xdataG);figure;      surf(fit);      view(2);          [rawXZ, rawYZ] = getMid(z,xdata) ;[gaussXZ, gaussYZ] = getMid(fit,xdataG) ;        figure; hold on;        scatter(rawXZ(:,1) , rawXZ(:,2), 40 , 'b' , 'filled');         plot(gaussXZ(:,1) , gaussXZ(:,2), 'r' );         hold off;    figure; hold on;        scatter(rawYZ(:,1) , rawYZ(:,2), 40 , 'b', 'filled' );         plot(gaussYZ(:,1) , gaussYZ(:,2) , 'r'  );         hold off;