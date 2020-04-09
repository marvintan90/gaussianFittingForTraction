Im = Im_df_10x_disk ;

scatter(coordsGauss_df_10x_disk(:,1),coordsGauss_df_10x_disk(:,2),20, 'b', "filled");
%---------------------------------------
    x2 = 298;
    y2 = 357;
    x1 = 232;
    y1 = 359;
    n=1;
for xn = x1:1:x2
    x(n) = xn;
    y(n) = lineY(xn , x1,x2,y1,y2);
    d(n) = sqrt( ((x(n)-x1)^2)  +   ((y(n)-y1)^2) );
    II(n) = Im( y(n),x(n) ) ;
    n++;
endfor
    figure; hold on;
    IIscaled = II - min(II);
	scatter(d,IIscaled, 20, 'r' , 'filled');
	plot(d,IIscaled);
    hold off;
%-------------------------------

newCoords = round( coordsGauss_df_10x_disk(:, 1:2) );
for n=1:size(newCoords,1)
    xc = newCoords(n,1) ;
    yc = newCoords(n,2) ;
    [xr,yr]=buildcoords(xc,yc, Im );
    z=Im(yr,xr);  % row=y, column=x
    signal(n) = max(max(z));
    noise(n) = min(min(z));
    snr(n) = signal(n)/noise(n);
endfor

disp('mean SNR = ');
disp(mean(snr));
disp('stdDev SNR = ');
disp(std(snr));