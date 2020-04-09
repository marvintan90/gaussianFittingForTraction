
function [mean_force, CC] = average_cell_force(imageFileName, modRefFileName, forceVectorFileName)
%--------------------------------------------------------------------------
% Author: Xie He, UCLA 
%
%--------------------------------------------------------------------------
% Description : Compute average cell force
%
% Output: 
%       mean_force     :  average forces applied on cells
%       CC.NumObjects  :  number of cells in the image
%       CC.PixelIdxList:  locations of pixels in each cell in linear index.
%--------------------------------------------------------------------------

% Load images
im = double(imread(imageFileName));
im = im(:,:,1);
im = im / max(max(im));
im = double(im > 0.9);
im = im';

%load data
forcevector = importdata(forceVectorFileName);
modRef = importdata(modRefFileName);
%pixel location of the pillars
location = ceil(modRef);
% calculate magnitude of force
F = sqrt(sum(forcevector.^2,2));
clear forcevector modRef
% Find connected components 
CC = bwconncomp(im,4);
forceField = sparse(location(:,1),location(:,2), F);
% padding 0 to make forceField the same size as im
forceField= padarray(forceField, size(im) - size(forceField),'post');
% location of the pillars
pillarmap = double(forceField > 0);
% calculate average force for each cell
mean_force = zeros(1,CC.NumObjects);
for i = 1:CC.NumObjects
    cell_mask = zeros(size(im)); % position of each individual cell
    cell_mask(CC.PixelIdxList{i}) = 1;
    mean_force(i) = sum(sum(cell_mask.* forceField))/ nnz(cell_mask.*pillarmap);
end
