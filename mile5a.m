%--------------------------
%milestone 5
%--------------------------

% Workspace items needed (from 4):
%   coordsd -           coords of bright spots via pkfnd() in dis.
%   coordsr -           coords of bright spots via pkfnd() in ref.
%   coordsdViagauss -   coords of bright spots via detpkViagauss() in dis.
%   coordsrViagauss -   coords of bright spots via detpkViagauss() in ref.
% Functions:
%   incx.m -            increment x coords.
%   incy.m -            increment y coords.
%   blowup.m -          scale up horizontal by 2nd argument, vert by third
%                       argument, centered around (x,y)=4th/5th argument.
%   rot.m -             rotate a list of coords by fi, centered at x&y.
%                       N.B: not used for alignment but it works.

  %  coordsdT = incx(coordsdViagauss,-6.25);
 %   coordsdT=incy(coordsdT,2.5);
  %   coordsdT = rot( coordsdT,590,165, 0.2 ) ;
    % coordsdT=blowup(coordsdT,1.02,1.02,294,298);

%-------------------------------------------


pkg load all;
graphics_toolkit("gnuplot");



  coordsGauss_df_10x_disk =   csvread('coordsGauss_df_10x_disk.csv');
coordsGauss_df2_10x_disk = csvread('coordsGauss_df2_10x_disk.csv');
    
%plot results after transformations:
figure; hold on;
%-------------------------------------------------------
      coordsdT1 = incx(coordsGauss_df_10x_disk(:,1:2), 9.1+184.6);  % reference image
      coordsdT1 = incy(coordsdT1, -3.1+13);
      coordsdT1 = rot( coordsdT1, mean(coordsdT1(:,1)), mean(coordsdT1(:,2)) , -3) ;
      % coordsdT1 = blowup( coordsdT1, 1.003 , 1 , median(coordsdT1(:,1)) , median(coordsdT1(:,2)) ) ;
 scatter(coordsdT1(:,1), coordsdT1(:,2) , 15   ,1);
%---------------------------------------------------------

      coordsdT2 = coordsGauss_df2_10x_disk(:,1:2);  % do not change cell image
  scatter(coordsdT2(:,1) , coordsdT2(:,2), 10  ,2  , 'filled'  );
  
%-----------------------------------------------------


% axis square;
