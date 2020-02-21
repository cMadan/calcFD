% 20190921 CRM
addpath('../calcFD')

sample              = 'IXI';
subjectpath         = sprintf('~/path/to/data/%s/surf/',sample);
subjects            = {'.'};
options.alg         = 'dilate';
options.countFilled = 1;


options.aparc       = 'Dest_aparc';
options.input       = 'lobeLat';
options.output      = sprintf('calcFD_%s_%s_%s_%g_%s.txt',sample,options.aparc,options.input,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc

options.aparc       = 'Dest_select';
options.input       = 'subcortLat';
options.output      = sprintf('calcFD_%s_%s_%s_%g_%s.txt',sample,options.aparc,options.input,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc
