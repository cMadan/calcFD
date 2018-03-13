% 20180313 CRM

%% load nii data, using one of three options

% (1) Matlab 2017b+ has this built-in as 'niftiread'
% V = niftiread('example_Sbunny.nii.gz');

% (2) FreeSurfer has a function 'load_nifti'
% nii = load_nifti('example_Sbunny.nii.gz');
% V   = nii.vol;

% (3) Use the NIfTI toolbox and use 'load_nii'
% (https://uk.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image)
nii = load_nii('example_Sbunny.nii.gz');
V   = nii.img;

%% select voxels to be part of region label
vol = V == 1;

%% calcFD
addpath('calcFD')
r = 2.^[0:4]; % box kernel size
n = calcFD_dilate(vol,r); 
c = [log2(fd_box)' ones(length(r),1)] \ -log2(n)'; 
fd = c(1);

%%

fd