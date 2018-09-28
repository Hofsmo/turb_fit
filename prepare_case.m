function [data, validation_data] = prepare_case(y, u, ratio, T, Ts )
%PREPARE_CASE Summary of this function goes here
%   Detailed explanation goes here

yd = decimate(y,ratio);
n = size(u,2);
ud = zeros(ceil(size(u,1)/ratio),n);
for i = 1:n
    ud(:,i) = decimate(u(:,i),ratio)';
end
Tsd = ratio*Ts;

T1=T/Tsd;

if T==-1
    data = detrend(iddata(yd,ud,Tsd));
    validation_data = [];
else
    data = iddata(yd(1:T1),ud(1:T1),Tsd);
    validation_data = iddata(yd(T1+1:end),ud(T1+1:end), Tsd);
end
end

