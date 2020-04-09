clear all;
pkg load all;
graphics_toolkit("gnuplot");


Im_df_10x_disk = double( imread('ref.tif') );
  figure;
      imagesc(Im_df_10x_disk); % colorbar;
      view(2);
figure;
      imagesc(Im_df_10x_disk); colorbar;
      view(2);
        saveas(gcf,'./mile3Out/image_ref_.tif','tiffn') ;

Im_df2_10x_disk = double( imread('cell.tif') );
  figure;
      imagesc(Im_df2_10x_disk); % colorbar;
      view(2);
figure;
      imagesc(Im_df2_10x_disk); colorbar;
      view(2);
        saveas(gcf,'./mile3Out/image_cell_.tif','tiffn') ;