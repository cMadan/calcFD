function vol = calcFD_volCrop(vol,pad)
% Crop the volume to make the calculations faster.
% Leave padding voxels around the bounding box so countFilled=0 will work
% properly.
% 20151025 CRM

% determine boundaries of voxels that have contents
dim = size(vol);
range_x = find(max(max(vol,[],2),[],3));
range_y = find(max(max(vol,[],1),[],3));
range_z = find(max(max(vol,[],1),[],2));

% how much to pad/margin?
% make sure padding wouldn't make index go outside original volume
range_x = max([1 min(range_x)-pad]):min([max(range_x)+pad dim(1)]);
range_y = max([1 min(range_y)-pad]):min([max(range_y)+pad dim(2)]);
range_z = max([1 min(range_z)-pad]):min([max(range_z)+pad dim(3)]);
vol     = vol(range_x,range_y,range_z);
% imagesc(sum(vol,3)); imagesc(max(temp,[],3))