function calcFD_save(fname,fd,subjects,labels)
% Output the FD values to a txt file
% 20151024 CRM

fid = fopen(fname,'w');

% headers
fprintf(fid,'%s\t','subID.calcFD');
% 20151119
% maybe improve later so col headers can be read from another file?
fprintf(fid,'label%g\t',labels);
fprintf(fid,'\n');

% write table
for s = 1:length(subjects)
    fprintf(fid,'%s\t',subjects{s});
    fprintf(fid,'%.4f\t',fd(s,:));
    fprintf(fid,'\n');
end

fclose(fid);