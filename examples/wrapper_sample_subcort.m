% 20160415 CRM
% 20180502 SK: modified to read in label names from a text file 
% if 'options.labelfile' is 'none', label names default to numerical 

addpath('../calcFD')

sample              = 'IXI';
subjectpath         = sprintf('~/path/to/data/%s/surf/',sample);
subjects            = {'.'};
options.alg         = 'dilate';
options.countFilled = 1;

options.aparc       = 'Dest_select';
% note, Dest_select can't have same FS-region in multiple txt-regions, (SK: 
% the first column in 'select_subcort.txt' refers to the left hemisphere)

options.input       = 'subcort';
options.labelfile   = 'select_subcort_legend.txt'; % 20180503 SK: provide label file for subcortical structures
options.output      = sprintf('calcFD_%s_%s_%s_%g_%s.txt',sample,options.aparc,options.input,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc

options.input       = 'ventricles'  ;
options.labelfile   = 'none'        ;
options.output      = sprintf('calcFD_%s_%s_%s_%g_%s.txt',sample,options.aparc,options.input,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc
