# calcFD toolbox
A toolbox for MATLAB for calculating the fractal dimensionality of a 3D structure, designed to work with intermediate files from FreeSurfer analysis pipeline, but can also use other volumes.

Current public version: build 26 [20160224]

## Citing the toolbox
Please cite this paper if you use the toolbox:

Madan, C. R., & Kensinger, E. A. (in press). Cortical complexity as a measure of age-related brain atrophy. NeuroImage.

## Documentation

```
function [fd,subjects] = calcFD(subjects,subjectpath,options)
% Calculate the fractal dimensionality of a 3D structure.
% Designed to work with intermediate files from FreeSurfer analysis pipeline
%   (ribbon.mgz, aparc.a2009s+aseg.mgz).
% Also can use other mgz volume as input (e.g., see 'benchmark folder').
% 
% See 'wrapper_sample.m' for an example of how to use the calcFD toolbox.
%
% Inputs:
% subjects      = list of subjects names in a cell array
%                 alternatively accepts {'.'} to run on all subjects in folder
%
% subjectpath   = FreeSurfer 'SUBJECTDIR' where standard directory structure is
%
% options       = specify details of running the analysis
%
% options.alg   = 'dilate' | 'boxcount'
%
% options.countFilled = 0 | 1
%                       0   == Surface-only (FDs)
%                       1   == Filled volume (FDf)
%
% options.aparc = 'Ribbon' | 'Dest_aparc' | 'Dest_select' | 'none'
%                 'Ribbon'      == Cortical Ribbon (unparcellated)
%                 'Dest_aparc'  == Parcellated cortical regions, 
%                                   ** requires options.input.
%                 'Dest_select' == Any region in the aparc.a2009s+aseg.mgz volume, 
%                                   ** requires options.input.
%                 'none'        == Binarized volume to be manually entered 
%                                   (e.g., benchmark volumes).
%
% options.input = filename string, required for 'Dest_aparc' and 'Dest_select
%               if options.aparc == 'Dest_aparc'
%                   This should be a file with the name 'mask_*.txt', 
%                       where * is the value in options.input.
%                   File should have either 74 or 148 rows, only 1 column.
%                       If only 74 values, labels are assigned bilaterally.
%                   Value in each row is the label to assign to that parcellated region, 
%                       based on the Destrieux et al. (2010) parcellation scheme.
%                   See 'mask_lobe.txt' for an example.
%                   See 'calcFD_mask.xlsx' for a list of which regions correspond to each row number.
%               --
%               if options.aparc == 'Dest_select'
%                   This should be a file with the name 'select_*.txt', 
%                       where * is the value in options.input.
%                   Regions correspond to intensity values in aparc.a2009s+aseg.mgz.
%                   See FreeSurfer files (e.g., FreeSurferColorLUT.txt, ASegStatsLUT.txt, 
%                       WMParcStatsLUT.txt) for mapping of region intensities to names.
%                   Multiple region values on the same row will be processed as a single structure.
%                   Currently requires each row to have the same number of values,
%                       if need to violate this, use multiple input text files.
%                   Currently cannot use the same region in more than one row,
%                       if need to violate this, use multiple input text files.
% 
% options.output = filename string to output FD values to
%
% ----
%
% The calcFD toolbox is available from: http://cmadan.github.io/calcFD/.
% 
% Please cite this paper if you use the toolbox:
%   Madan, C. R., & Kensinger, E. A. (in press). Cortical complexity as a measure of 
%       age-related brain atrophy. NeuroImage.
%
% 
% 20160224 CRM
% build 26

```