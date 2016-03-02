function n = calcFD_dilate(vol,r)
% Implementation of the dilation algorithm.
% 20151025 CRM

if length(size(vol)) <  3 | length(r) < 1
    % unable to calculate any box counting
    fprintf('Failed to count!')
    n = NaN;
    return;
end

for rr = r
    kernel = ones([rr rr rr]);
    kernel = kernel/sum(kernel(:));
    vol_r = convn(vol,kernel,'same');
    nn = sum(vol_r(:)>0);
    nn = nn/rr^3;
    if nn==0
        % found no voxels, shouldn't occur
        keyboard
    end
    n(find(r==rr)) = nn;
end