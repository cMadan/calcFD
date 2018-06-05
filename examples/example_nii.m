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
% make sure this value is one of the regions included in the intensity coding of the parcellated/segmented image
% e.g., confirm with "unique(V)"
% if this region code doesn't exist, the toolbox will enter debug mode and say the region wasn't found
vol = V == 1;

%% do calcFD
% add the calcFD path to the MATLAB environment
addpath('../calcFD')
% define desired box kernel sizes
r = 2.^[0:4]; % i.e., [1,2,4,8,16]
% determine the 'counts' using the dilation algorithm
n = calcFD_dilate(vol,r); 
% perform a simple linear regression of the log2-transformed box sizes and log2-transformed counts
c = [log2(r)' ones(length(r),1)] \ -log2(n)'; 
% take the coefficient corresponding to the slope as the fractal dimensionality (fd) value
fd = c(1);

%%

fd
