function n = calcFD_boxcount(vol,r)
% Implementation of the 3D box-counting algorithm.
% 20151025 CRM

if length(size(vol)) <  3 | length(r) < 1
    % unable to calculate any box counting
    fprintf('Failed to count!')
    n = NaN;
    return;
end

dim = size(vol);

for rr = r
    step = rr;
    dim_r = dim / step;
    % adjust for partial boxes
    dim_r = ceil(dim_r);
    vol_r = zeros(dim_r);

    % grid out the brain
    if rr == 1
        % no need to re-sample the voxel space
        vol_r = vol;
    else
        for i = 1:dim_r(1); for j = 1:dim_r(2); for k = 1:dim_r(3);
            % adjust for partial boxes
            range_x = ((i-1)*step+1):min([i*step dim(1)]);
            range_y = ((j-1)*step+1):min([j*step dim(2)]);
            range_z = ((k-1)*step+1):min([k*step dim(3)]);
            box = vol(range_x,range_y,range_z);
            vol_r(i,j,k) = max(box(:));
        end; end; end;
    end

    nn = sum(vol_r(:)>0);
    if nn==0
        % found no voxels, shouldn't occur
        keyboard
    end
    n(find(r==rr)) = nn;
end