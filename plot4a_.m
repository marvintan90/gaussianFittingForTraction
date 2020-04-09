pkg load all;
graphics_toolkit("gnuplot");


coords_df_10x_disk = csvread('coords_df_10x_disk.csv');
coords_df2_10x_disk = csvread('coords_df2_10x_disk.csv');

figure;
      scatter(  coords_df_10x_disk(:,1) , coords_df_10x_disk(:,2) , 5, coords_df_10x_disk(:,3) , 'filled');   %   ref

figure;
      scatter(  coords_df2_10x_disk(:,1) , coords_df2_10x_disk(:,2) , 5, coords_df2_10x_disk(:,3) , 'filled');  %cell