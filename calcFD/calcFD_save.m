function calcFD_save(fname,fd,subjects,labels,labelfile)
% Output the FD values to a txt file
% 20151024 CRM
%
% 20180503 SK: modified to read in the headers from label file if provided,
% else labels are numerical
%

% file identifier
fid     = fopen(fname,'w')              ;

% headers
fprintf(fid,'%s\t','subID.calcFD')      ;

% no label file provided
if strcmp(labelfile, 'none')
    
    fprintf(fid,'label%g\t',labels)                 ;
    
% if label file is provided read in column header names
else
    
    % file identifier for label file
    fid_legend = fopen(labelfile,'r')               ;
    
    % read col headers to cell
    headers_cell = textscan(fid_legend, '%s')       ;
    
    % assign col headers to output
    fprintf(fid, '%s\t', headers_cell{1}{:})        ;
    
end

% new paragraph
fprintf(fid,'\n');

% write table
for s = 1:length(subjects)
    fprintf(fid,'%s\t',subjects{s});
    fprintf(fid,'%.4f\t',fd(s,:));
    fprintf(fid,'\n');
end

fclose(fid);