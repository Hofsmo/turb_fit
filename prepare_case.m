function [data, validation_data] = prepare_case(y, u, ratio, Ts )
%PREPARE_CASE Summary of this function goes here
%   Detailed explanation goes here

yd = decimate(y,ratio);
n = size(u,2);
ud = zeros(ceil(size(u,1)/ratio),n);
for i = 1:n
    ud(:,i) = decimate(u(:,i),ratio)';
end
Tsd = ratio*Ts;
T1=floor(numel(yd)/2);

data = iddata(yd(1:T1,:),ud(1:T1,:),Tsd);
validation_data = iddata(yd(T1+1:end,:),ud(T1+1:end,:), Tsd);

data = detrend(data);
validation_data = detrend(validation_data);


end

