function [t, f, g, Pe, uc] = read_fcp_data_2(fname)
% read file
fid = fopen(fname);
out = textscan(fid, '%s %s %s %s %s %s %s %s %s', 'HeaderLines', 1);
fclose(fid);

% Create empty data vector
data = zeros(numel(out{1}), numel(out));

for i = 1:numel(out)
    % Replace all commas with decimal points
    decimal_strings = regexprep(out{i}, ',', '.');

    % Convert to doubles and join all rows together
    temp = cellfun(@str2num, decimal_strings, 'uni', 0);
    data(:,i) = cat(1, temp{:});
end

t = data(:,1); % time
f = data(:,2); % generated frequency signal
g = data(:,3:7); % servo opening
Pe = data(:,8); % electrical powers
uc = data(:,9); % output of PID
