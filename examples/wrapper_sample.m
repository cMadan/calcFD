% 20160209 CRM
addpath('calcFD')

sample              = 'IXI';
subjectpath         = sprintf('~/path/to/data/%s/surf/',sample);
subjects            = {'.'};
options.alg         = 'dilate';
options.countFilled = 1;

options.aparc       = 'Ribbon';
options.output      = sprintf('calcFD_%s_%s_%g_%s.txt',sample,options.aparc,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc

options.aparc       = 'Dest_aparc';
options.input       = 'lobe';
options.output      = sprintf('calcFD_%s_%s_%g_%s.txt',sample,options.aparc,options.countFilled,options.alg);
tic;[fd,subjects]   = calcFD(subjects,subjectpath,options);toc
