function [t, f_sim, g, Pe, f, uc] = read_aura(fname)
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
f_sim = data(:,2); % generated frequency signal
g = data(:,4); % servo opening
Pe = data(:,5); % electrical power
f = data(:,6); % frequency
uc = data(:,8); % output of PID
