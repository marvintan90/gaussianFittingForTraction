clear all;
pkg load all;
graphics_toolkit("gnuplot");
%--------------------------
%milestone 4a
%--------------------------

 %   
 
 
Im_df_10x_disk = double( imread('ref.tif') );
Im_df2_10x_disk = double( imread('cell.tif') );
csvwrite('Im_df_10x_disk.csv',Im_df_10x_disk);
csvwrite('Im_df2_10x_disk.csv',Im_df2_10x_disk);


coords_df_10x_disk = pll_mile4a(Im_df_10x_disk ,70,8) ; % reference image, change number 70 to threshold number
coords_df2_10x_disk = pll_mile4a(Im_df2_10x_disk ,20,8) ; % cell image, change number 50 to threshold number
csvwrite('coords_df_10x_disk.csv',coords_df_10x_disk);
csvwrite('coords_df2_10x_disk.csv',coords_df2_10x_disk);


disp("end");
