function vol = hollowVol(vol)
% If not counting inner voxels, need to empty out the volume.
% 20151025 CRM

dim = size(vol);

% compare with adjacent voxels to see
% if we are inside a filled region or not
vol_edge = vol;
for i = 1:dim(1); for j = 1:dim(2); for k = 1:dim(3);
    if vol(i,j,k) == 1
        range_i = [max([1 i-1]) min([i+1 dim(1)])];
        range_j = [max([1 j-1]) min([j+1 dim(2)])];
        range_k = [max([1 k-1]) min([k+1 dim(3)])];
        vals = vol(range_i,range_j,range_k);
        if min(vals) == 1
            % this is an inner voxel, surrounded by
            % other filled voxels
            vol_edge(i,j,k) = 0;
        end
    end
end; end; end;
vol = vol_edge;