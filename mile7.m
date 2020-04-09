% mile 7
clear all;
pkg load all;
graphics_toolkit("gnuplot");




[mean_force, CC] = average_cell_force('fluor.tif', 'new_modRef.csv', 'new_forceVector.csv')

