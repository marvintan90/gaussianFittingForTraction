clear all;
pkg load all;
graphics_toolkit("gnuplot");

Im_df_10x_disk = csvread('Im_df_10x_disk.csv');
Im_df2_10x_disk = csvread('Im_df2_10x_disk.csv');


coords_df_10x_disk = csvread('coords_df_10x_disk.csv');
coords_df2_10x_disk = csvread('coords_df2_10x_disk.csv');