# calcFD toolbox
A toolbox for MATLAB for calculating the fractal dimensionality of a 3D structure, designed to work with intermediate files from FreeSurfer analysis pipeline, but can also use other volumes.

Current public version: build 28 [20160616]

## Citing the toolbox
Please cite this paper if you use the toolbox:

Madan, C. R., & Kensinger, E. A. (2016). Cortical complexity as a measure of age-related brain atrophy. *NeuroImage, 134*, 617-629. doi:10.1016/j.neuroimage.2016.04.029

If you use the toolbox with subcortical/ventricular structures, please **also** cite:

Madan, C. R., & Kensinger, E. A. (2017). Age-related differences in the structural complexity of subcortical and ventricular structures. *Neurobiology of Aging, 50*, 87-95. doi:10.1016/j.neurobiolaging.2016.10.023

Also see:

Madan, C. R., & Kensinger, E. A. (2017). Test-retest reliability of brain morphology estimates. *Brain Informatics*. doi:10.1007/s40708-016-0060-4  


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
% REQUIRED INPUTS:
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
% options.aparc = 'Ribbon' | 'Dest_aparc' | 'Dest_select' | 'DKT' | 'none'
%                 'Ribbon'      == Cortical Ribbon (unparcellated)
%                 'Dest_aparc'  == Parcellated cortical regions (Destrieux) 
%                                   ** requires options.input.
%                 'Dest_select' == Any region in the aparc.a2009s+aseg.mgz volume, 
%                                   ** requires options.input.
%                 'DKT'         == Parcellated cortical regions (DKT).
%                                   ** requires aparc.DKTaltas40+aseg.mgz to exist.
%                                   The volume can be generated using:
%                                   mri_aparc2aseg --s [SUBJECTID] --annot aparc.DKTatlas40
%                                   See Madan & Kensinger (2017, Brain Informatics) for further details. 
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
%                   Currently cannot use the same region in more than one row,
%                       if need to violate this, use multiple input text files.
%                   See 'select_subcort.txt' and 'select_ventricles.txt' for examples.
% 
% options.output = filename string to output FD values to
%
%
% OPTIONAL INPUTS:
% options.boxsizes = list of numbers
%                    Default: 2.^[0:4] (resolves to [1,2,4,8,16])
%                    Specify what 'box sizes' (also applies to dilation algorithm) to use 
%                    when calculating FD.
%                    Preferred to scale in powers of two.
%
% ----
%
% The calcFD toolbox is available from: http://cmadan.github.io/calcFD/.
% 
% Please cite this paper if you use the toolbox:
%   Madan, C. R., & Kensinger, E. A. (2016). Cortical complexity as a measure of 
%       age-related brain atrophy. NeuroImage, 134, 617-629.
%       doi:10.1016/j.neuroimage.2016.04.029
%
% If you use the toolbox with subcortical/ventricular structures, please also cite:
%   Madan, C. R., & Kensinger, E. A. (2017). Age-related differences in the structural 
%       complexity of subcortical and ventricular structures. Neurobiology of Aging, 50, 87-95. 
%       doi:10.1016/j.neurobiolaging.2016.10.023
%
% 
% 20160616 CRM
% build 28
```

# Potential future improvements
- Read label names from `_legend.txt` files, rather than just assigning label1, label2, etc. in header row
