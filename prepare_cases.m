function [data] = prepare_cases(y, u, ratio, Ts)
%PREPARE_CASES
%   Does the same as prepare_case, but for several cases.
data = {};
for i = 1:size(y, 2)
    [data{i}, ~] = prepare_case(y(:, i), u(:, i), ratio, -1, Ts );
end

end