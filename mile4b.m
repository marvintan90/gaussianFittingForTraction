%--------------------------
%milestone 4b
%--------------------------
% num_process=8 ;

pkg load all;
graphics_toolkit("gnuplot");


Im_df_10x_disk = double( imread('ref.tif') );
Im_df2_10x_disk = double( imread('cell.tif') );

coords_df_10x_disk = csvread('coords_df_10x_disk.csv');
coords_df2_10x_disk = csvread('coords_df2_10x_disk.csv');

coordsGauss_df_10x_disk = pll_mile4b(coords_df_10x_disk, Im_df_10x_disk ) ;
coordsGauss_df2_10x_disk = pll_mile4b(coords_df2_10x_disk, Im_df2_10x_disk ) ;

csvwrite('coordsGauss_df_10x_disk.csv',coordsGauss_df_10x_disk);
csvwrite('coordsGauss_df2_10x_disk.csv',coordsGauss_df2_10x_disk);


%   [o1, o2, …] = parcellfun (num_process, pll_mile4b , a1, a2, …)
